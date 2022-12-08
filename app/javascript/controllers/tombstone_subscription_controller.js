import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="tombstone-subscription"
export default class extends Controller {
  static values = { tombstoneId: Number }
  static targets = ["messages"]


  connect() {
    console.log('ok')
    this.channel = createConsumer().subscriptions.create(
      { channel: "TombstoneChannel", id: this.tombstoneIdValue },
      {
        received: data => this.#insertMessageAndScrollDown(data),
      }
    )

  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("afterbegin", data)
    // this.messagesTarget.scrollTop(0, this.messagesTarget.scrollHeight)
  }


  resetForm(event) {
    event.target.reset()
  }
}
