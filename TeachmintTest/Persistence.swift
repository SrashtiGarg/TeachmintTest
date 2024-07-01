//
//  Persistence.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<15 {
            let newItem = Item(context: viewContext)
            switch i {
            case 0:
                newItem.contributerLink = "https://api.github.com/repos/kriskowal/q/contributors"
                newItem.projectLink = "https://github.com/kriskowal/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/60294?v=4"
                newItem.repoDesc = "A promise library for JavaScript"
                newItem.repoName = "kriskowal/q"
            case 1:
                newItem.contributerLink = "https://api.github.com/repos/harelba/q/contributors"
                newItem.projectLink = "https://github.com/harelba/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/985765?v=4"
                newItem.repoDesc = "q - Run SQL directly on delimited files and multi-file sqlite databases"
                newItem.repoName = "harelba/q"
            case 2:
                newItem.contributerLink = "https://api.github.com/repos/cycfi/q/contributors"
                newItem.projectLink = "https://github.com/cycfi/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/17003623?v=4"
                newItem.repoDesc = "C++ Library for Audio Digital Signal Processing"
                newItem.repoName = "cycfi/q"
            case 3:
                newItem.contributerLink = "https://api.github.com/repos/ryboe/q/contributors"
                newItem.projectLink = "https://github.com/ryboe/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/1250684?v=4"
                newItem.repoDesc = "Quick and dirty debugging output for tired Go programmers"
                newItem.repoName = "ryboe/q"
            case 4:
                newItem.contributerLink = "https://api.github.com/repos/qbittorrent/qBittorrent/contributors"
                newItem.projectLink = "https://github.com/qbittorrent/qBittorrent"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/2131270?v=4"
                newItem.repoDesc = "qBittorrent BitTorrent client"
                newItem.repoName = "qbittorrent/qBittorrent"
            case 5:
                newItem.contributerLink = "https://api.github.com/repos/natesales/q/contributors"
                newItem.projectLink = "https://github.com/natesales/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/20391440?v=4"
                newItem.repoDesc = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
                newItem.repoName = "natesales/q"
            case 6:
                newItem.contributerLink = "https://api.github.com/repos/zestyping/q/contributors"
                newItem.projectLink = "https://github.com/zestyping/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/236086?v=4"
                newItem.repoDesc = "Quick and dirty debugging output for tired programmers. ⛺"
                newItem.repoName = "zestyping/q"
            case 7:
                newItem.contributerLink = "https://api.github.com/repos/pwnwiki/q/contributors"
                newItem.projectLink = "https://github.com/pwnwiki/q"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/6068441?v=4"
                newItem.repoDesc = "Exploit Pack for Metasploit - Collection of modules gathered across time and internets"
                newItem.repoName = "pwnwiki/q"
            case 8:
                newItem.contributerLink = "https://api.github.com/repos/ialbert/biostar-central/contributors"
                newItem.projectLink = "https://github.com/ialbert/biostar-central"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/46249?v=4"
                newItem.repoDesc = "Biostar Q&A"
                newItem.repoName = "ialbert/biostar-central"
            case 9:
                newItem.contributerLink = "https://api.github.com/repos/microsoft/qsharp-compiler/contributors"
                newItem.projectLink = "https://github.com/microsoft/qsharp-compiler"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/6154722?v=4"
                newItem.repoDesc = "Q# compiler, command line tool, and Q# language server"
                newItem.repoName = "microsoft/qsharp-compiler"
            case 10:
                newItem.contributerLink = "https://api.github.com/repos/yenchenlin/DeepLearningFlappyBird/contributors"
                newItem.projectLink = "https://github.com/yenchenlin/DeepLearningFlappyBird"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/7057863?v=4"
                newItem.repoDesc = "Flappy Bird hack using Deep Reinforcement Learning (Deep Q-learning)."
                newItem.repoName = "yenchenlin/DeepLearningFlappyBird"
            case 11:
                newItem.contributerLink = "https://api.github.com/repos/zestyping/q/contributors"
                newItem.projectLink = "https://github.com/microsoft/QuantumKatas"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/236086?v=4"
                newItem.repoDesc = "Quick and dirty debugging output for tired programmers. ⛺"
                newItem.repoName = "zestyping/q"
            case 12:
                newItem.contributerLink = "https://api.github.com/repos/microsoft/QuantumKatas/contributors"
                newItem.projectLink = "ddf"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/6154722?v=4"
                newItem.repoDesc = "Tutorials and programming exercises for learning Q# and quantum computing"
                newItem.repoName = "microsoft/QuantumKatas"
            case 13:
                newItem.contributerLink = "https://api.github.com/repos/caelum/mamute/contributors"
                newItem.projectLink = "https://github.com/caelum/mamute"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/65012?v=4"
                newItem.repoDesc = "Q&A Engine"
                newItem.repoName = "caelum/mamute"
            case 14:
                newItem.contributerLink = "https://api.github.com/repos/qTox/qTox/contributors"
                newItem.projectLink = "https://github.com/qTox/qTo"
                newItem.repoImage = "https://avatars.githubusercontent.com/u/9519241?v=4"
                newItem.repoDesc = "qTox is a chat, voice, video, and file transfer IM client using the encrypted peer-to-peer Tox protocol."
                newItem.repoName = "qTox/qTox"
                
            default:
                break
            }
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TeachmintTest")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
