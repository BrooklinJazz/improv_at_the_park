// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies by importing them.
//
// import "phoenix_html"

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  hooks: {
    // Custom hook for smooth scrolling
    ScrollTo: {
      mounted() {
        this.handleEvent("scroll-to-section", ({section}) => {
          const element = document.getElementById(section)
          if (element) {
            element.scrollIntoView({behavior: "smooth"})
          }
        })
      }
    },
    // Custom hook for modal functionality
    Modal: {
      mounted() {
        this.handleEvent("show-modal", ({show}) => {
          const modal = document.getElementById("show-modal")
          const title = document.getElementById("modal-title")
          const description = document.getElementById("modal-description")
          const date = document.getElementById("modal-date")
          const time = document.getElementById("modal-time")
          const location = document.getElementById("modal-location")
          
          if (modal && title && description && date) {
            title.textContent = show.title
            description.textContent = show.description
            date.textContent = show.date
            if (time) time.textContent = show.time
            if (location) location.textContent = show.location
            modal.classList.remove("hidden")
          }
        })
        
        this.handleEvent("close-modal", () => {
          const modal = document.getElementById("show-modal")
          if (modal) {
            modal.classList.add("hidden")
          }
        })
      }
    },
    // Custom hook for clipboard functionality
    ClipboardCopy: {
      mounted() {
        this.el.addEventListener("click", () => {
          const text = this.el.getAttribute("data-clipboard-text")
          if (text) {
            navigator.clipboard.writeText(text).then(() => {
              // Show success feedback
              const originalText = this.el.textContent
              this.el.textContent = "Copied!"
              this.el.style.color = "#059669" // green-600
              
              setTimeout(() => {
                this.el.textContent = originalText
                this.el.style.color = ""
              }, 1500)
            }).catch(err => {
              console.error("Could not copy text: ", err)
              // Fallback: open mailto link for email addresses
              if (text.includes("@")) {
                window.location.href = `mailto:${text}`
              }
            })
          }
        })
      }
    }
  }
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(200))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

