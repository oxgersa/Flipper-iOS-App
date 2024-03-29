import SwiftUI

struct InfoView: View {
    @StateObject var viewModel: InfoViewModel
    @StateObject var alertController: AlertController = .init()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                if viewModel.isEditing {
                    SheetEditHeader(
                        title: "Editing",
                        description: viewModel.item.name.value,
                        onSave: viewModel.saveChanges,
                        onCancel: viewModel.undoChanges
                    )
                } else {
                    SheetHeader(
                        title: viewModel.item.isNFC ? "Card Info" : "Key Info",
                        description: viewModel.item.name.value
                    ) {
                        viewModel.dismiss()
                    }
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        CardView(
                            item: $viewModel.item,
                            isEditing: $viewModel.isEditing,
                            kind: .existing
                        )
                        .padding(.top, 6)
                        .padding(.horizontal, 24)

                        EmulateView(viewModel: .init(item: viewModel.item))
                            .opacity(viewModel.isEditing ? 0 : 1)
                            .environmentObject(alertController)

                        VStack(alignment: .leading, spacing: 2) {
                            if viewModel.item.isEditableNFC {
                                InfoButton(
                                    image: "HexEditor",
                                    title: "Edit Dump"
                                ) {
                                    viewModel.showDumpEditor = true
                                }
                                .foregroundColor(.primary)
                            }
                            InfoButton(
                                image: "Share",
                                title: "Share"
                            ) {
                                viewModel.share()
                            }
                            .foregroundColor(.primary)
                            InfoButton(
                                image: "Delete",
                                title: "Delete"
                            ) {
                                viewModel.delete()
                            }
                            .foregroundColor(.sRed)
                        }
                        .padding(.top, 8)
                        .padding(.horizontal, 24)
                        .opacity(viewModel.isEditing ? 0 : 1)

                        Spacer()
                    }
                }
            }

            if alertController.isPresented {
                alertController.alert
            }
        }
        .bottomSheet(isPresented: $viewModel.showShareView) {
            ShareView(viewModel: .init(item: viewModel.item))
        }
        .fullScreenCover(isPresented: $viewModel.showDumpEditor) {
            NFCEditorView(viewModel: .init(item: $viewModel.item))
        }
        .alert(isPresented: $viewModel.isError) {
            Alert(title: Text(viewModel.error))
        }
        .onReceive(viewModel.dismissPublisher) {
            dismiss()
        }
        .background(Color.background)
        .edgesIgnoringSafeArea(.bottom)
        .environmentObject(alertController)
    }
}

struct InfoButton: View {
    let image: String
    let title: String
    let action: () -> Void

    init(
        image: String,
        title: String,
        action: @escaping () -> Void,
        longPressAction: @escaping () -> Void = {}
    ) {
        self.image = image
        self.title = title
        self.action = action
    }

    var body: some View {
        Button {
        } label: {
            HStack(spacing: 8) {
                Image(image)
                    .renderingMode(.template)
                Text(title)
                    .font(.system(size: 14, weight: .medium))
            }
            .frame(minWidth: 44, minHeight: 44)
            .padding(.trailing, 44)
        }
        .simultaneousGesture(TapGesture().onEnded {
            action()
        })
    }
}
