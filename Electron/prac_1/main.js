// For TypeScript => require('electron/main')
const { app, BrowserWindow } = require('electron')

const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}

// Many of Electron's core modules are Node.js event emitters that adhere to Node's asynchronous event-driven architecture. The app module is one of these emitters.
app.whenReady().then(() => {
  createWindow()

  //In contrast, macOS apps generally continue running even without any windows open. Activating the app when no windows are available should open a new one.
//To implement this feature, listen for the app module's activate event, and call your existing createWindow() method if no BrowserWindows are open.
   app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})