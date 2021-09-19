import Core
import Combine
import Injector
import struct Foundation.UUID

class ConnectionsViewModel: ObservableObject {
    @Inject private var central: BluetoothCentral
    @Inject private var connector: BluetoothConnector
    private var disposeBag = DisposeBag()

    @Published private(set) var state: BluetoothStatus = .notReady(.preparing) {
        didSet {
            switch state {
            case .ready where oldValue != .ready:
                central.startScanForPeripherals()
            case .notReady:
                peripherals.removeAll()
            default:
                break
            }
        }
    }

    @Published private(set) var peripherals: [Peripheral] = []

    init() {
        central.status.combineLatest(central.peripherals)
            .sink { [weak self] status, peripherals in
                self?.state = status
                // FIXME: don't publish empty erray
                guard !peripherals.isEmpty else { return }
                self?.peripherals = peripherals
            }
            .store(in: &disposeBag)

        connector.connectedPeripherals
            .sink { [weak self] connected in
                guard let self = self else { return }
                connected.forEach { peripheral in
                    if let index = self.peripherals.firstIndex(
                        where: { $0.id == peripheral.id }
                    ) {
                        self.peripherals[index] = peripheral
                    }
                }
            }
            .store(in: &disposeBag)
    }

    func connect(to uuid: UUID) {
        connector.connect(to: uuid)
    }

    func openApplicationSettings() {
        Application.openSettings()
    }

    deinit {
        self.central.stopScanForPeripherals()
    }
}

extension BluetoothStatus.NotReadyReason: CustomStringConvertible {
    // TODO: support localizations here
    public var description: String {
        switch self {
        case .poweredOff:
            return "Bluetooth is powered off"
        case .preparing:
            return "Bluetooth is not ready"
        case .unauthorized:
            return "The application is not authorized to use Bluetooth"
        case .unsupported:
            return "Bluetooth is not supported on this device"
        }
    }
}