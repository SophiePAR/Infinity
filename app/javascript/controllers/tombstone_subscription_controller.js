import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="tombstone-subscription"
export default class extends Controller {
  static values = { tombstoneId: Number }
  static targets = ["messages"]


  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "TombstoneChannel", id: this.tombstoneIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)
      }
    )

    console.log(`Subscribed to the tombstone with the id ${this.tombstoneIdValue}.`)
    console.log('hello');

  //   resetForm(event) {
  //     event.target.reset()
  //   }

  //   #insertMessageAndScrollDown(data) {
  //     this.messagesTarget.insertAdjacentHTML("beforeend", data)
  //     this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  //   }
  }
}
