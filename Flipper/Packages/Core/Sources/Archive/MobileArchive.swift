import Inject
import Peripheral
import Foundation

class MobileArchive: MobileArchiveProtocol {
    @Inject var storage: MobileArchiveStorage
    private var manifest: Manifest?

    init() {}

    func getManifest(
        progress: (Double) -> Void
    ) async throws -> Manifest {
        progress(1)
        if let manifest = manifest {
            return manifest
        } else {
            let manifest = try await storage.manifest
            self.manifest = manifest
            return manifest
        }
    }

    func read(
        _ path: Path,
        progress: (Double) -> Void
    ) async throws -> String {
        try await storage.get(path)
    }

    func upsert(
        _ content: String,
        at path: Path,
        progress: (Double) -> Void
    ) async throws {
        try await storage.upsert(content, at: path)
        manifest?[path] = .init(content.md5)
    }

    func delete(_ path: Path) async throws {
        try await storage.delete(path)
        manifest?[path] = nil
    }

    func compress() -> URL? {
        storage.compress()
    }
}
