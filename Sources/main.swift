// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation 
import InkSwift

guard  let storyJsonUrl = Bundle.module.url(forResource: "test.ink", withExtension: "json") else {
    fatalError("Could not find test.ink.json in bundle")
}

guard let storyJson = try? String(contentsOf: storyJsonUrl) else {
    fatalError("Could not read test.ink.json as a string.")
}

let story = InkStory()

story.loadStory(json: storyJson)

// As long as the story can continue (either because there is more text or there are options you can choose)), keep the loop going
while story.canContinue || story.options.count > 0 {
    // Print the current text to the console/terminal
    print(story.currentText)
    
    // If you can continue the story, we wait for input before continuing.
    if story.canContinue {
        print("Press 'enter' to continue")
        _ = readLine()
        story.continueStory()
    }
    // If there are options, show the options and wait for player to choose
    else if story.options.count > 0 {
        // print every option
        for option in story.options {
            print("\(option.index). \(option.text)")
        }
        print("What is your choice?")
        
        // wait for input from player
        if let choice = readLine() {
            // try and convert input to an index.
            if let index = Int(String(choice.first ?? "a")) {
                // choose the selected option index
                story.chooseChoiceIndex(index)
            }
        }
    }
}
// no more content, story is done.
print("Story done!")