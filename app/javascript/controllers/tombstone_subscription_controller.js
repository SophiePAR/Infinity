import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tombstone-subscription"
export default class extends Controller {
  static values = { tombstoneId: Number }
  static targets = ["messages"]


  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "tombstoneChannel", id: this.tombstoneIdValue },
      { received: data =>
        this.#insertMessageAndScrollDown(data)
      }

    )
    console.log(`Subscribed to the tombstone with the id ${this.tombstoneIdValue}.`)
    console.log('hello');

    resetForm(event) {
      event.target.reset()
    }

    #insertMessageAndScrollDown(data) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data)
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    }
  }
}
