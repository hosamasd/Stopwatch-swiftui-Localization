//
//  TimerViewModel.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    
    @Published var isStop = false
    @Published var isReset = true

    @Published var isBegin = false
    @Published var startText = "Start"
    @Published var startColor = Color.green
    @Published var timer = Timer()
    @Published var labText:String = "Lap"
    @Published var labColor = Color.black
    @Published var labEnabled = false
    
    @Published var bigLabel = "00:00:00"
    @Published var smallLabel = "00:00:00"
    
    //second
    @Published var seconds = 0
    @Published var lapCount = 0
    
  @Published  var stopwatchArray = [StopwatchModel]()

    var changingMailIndex = -1
    var isChanging = false

    
     func handleLab()  {
      labEnabled = isBegin ? true : false
       labText == "Lap" ?  makeLapButton() : makeResetButton()
   }
    
    fileprivate  func makeLapButton()  {
        let stop = StopwatchModel(counter: seconds, lapCount: lapCount + 1, lapText: bigLabel)
       
        DispatchQueue.main.async {
            self.stopwatchArray.append(stop)
        }
        lapCount += 1
    }
    
    fileprivate func makeResetButton()  {
        isBegin = false
        labEnabled = false
        labText="Lap"
        timer.invalidate()
        seconds = 0
        lapCount = 0
        stopwatchArray.removeAll()
        
        DispatchQueue.main.async {
            self.upadteLabels()
        }
        
    }
    
    
    func handleStart()  {
        if startText == "Stop" {
            stopButtons()
            isStop=false
        }else {
            startButtons()
            isStop=true
        }
        //        upadteLabels()
    }
    
    fileprivate func stopButtons()  {
        timer.invalidate()
        startText="Start"
        startColor = .green
        labText="Reset"
        isReset=false
    }
    
    fileprivate func startButtons()  {
        isBegin = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        startText="Stop"
        startColor = .red
        labText="Lap"
        isReset=true
        labEnabled = true
    }
    //
    fileprivate func upadteLabels() {
        bigLabel = timeString(time: TimeInterval(seconds))
        smallLabel = timeString(time: TimeInterval(seconds))
    }
    
    fileprivate func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @objc fileprivate func updateTimer() {
        seconds += 1
        upadteLabels()
        
    }
    
    //delete mail
    func handleDeleteGesture(mail: StopwatchModel, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = stopwatchArray.firstIndex(where: { $0.id == mail.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth >= -120 {
                        stopwatchArray[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth < -120 {
                        stopwatchArray[index].offsetX = -60
                    }
                    
                    if swipeWidth < -240 {
                        //delete mail
                        deleteMailIndex(index: index)
                    }
                }
                
            }
        }
    }
    
    // now lets do same operation in swipe right gesture like design
    func handleReadGesture(mail: StopwatchModel, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = stopwatchArray.firstIndex(where: { $0.id == mail.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth <= 120 {
                        stopwatchArray[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth > 120 {
                        stopwatchArray[index].offsetX = 60
                    }
                    
                    if swipeWidth > 240 {
                        //delete mail
                        deleteMailIndex(index: index)
                    }
                }
                
            }
        }
    }
    
    func swipeStarted(index: Int) {
        if (changingMailIndex != -1 && !isChanging) {
            stopwatchArray[changingMailIndex].offsetX = 0.0
            isChanging = true
        }
        changingMailIndex = index
    }
    
    func deleteMailIndex(index: Int) {
        if index == changingMailIndex {
            changingMailIndex = -1
        }
        stopwatchArray.remove(at: index)
    }
    
    func deleteMail(mail: StopwatchModel) {
        if let index = stopwatchArray.firstIndex(where: { $0.id == mail.id }) {
            if index == changingMailIndex {
                changingMailIndex = -1
            }
            stopwatchArray.remove(at: index)
        }
    }
    
    func markRead(mail: StopwatchModel) {
        if let index = stopwatchArray.firstIndex(where: { $0.id == mail.id }) {
            withAnimation(.linear) {
//                stopwatchArray[index].isRead = true
                stopwatchArray[index].offsetX = 0.0
            }
        }
    }
    
    func swipeEnded() {
        isChanging = false
        
        let readStart: CGFloat = 55.0
        let readEnd: CGFloat = 60.0
        let markReadRange = readStart...readEnd
        
        let deleteStart: CGFloat = -60.0
        let delteEnd: CGFloat = -55.0
        let markDeleteRange = deleteStart...delteEnd
        
        if (changingMailIndex != -1) {
            if !markReadRange.contains(stopwatchArray[changingMailIndex].offsetX) && !markDeleteRange.contains(stopwatchArray[changingMailIndex].offsetX) {
                withAnimation(.linear) {
                    stopwatchArray[changingMailIndex].offsetX = 0.0
                }
            }
        }
    }
}
