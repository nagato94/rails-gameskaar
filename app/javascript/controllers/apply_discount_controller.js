import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="apply-discount"
export default class extends Controller {
  static targets = ["price", "input", "discount", "finalPrice"]
  connect() {
    console.log("ApplyDiscountController connected")
  }


  // Connects to data-action="click->apply-discount#apply"
  count(event) {
    event.preventDefault()

    const initialPrice = parseFloat(this.priceTarget.dataset.initialPrice);

    const couponCode = this.inputTarget.value;

    let discount = 0;
    if(couponCode === "ILOVELEAGUEOFLEGENDS") {
      discount = 10;
    }

    let finalPrice = initialPrice - discount;
    if (finalPrice < 0) {
      finalPrice = 0;
    }

    if (discount > 0) {
      this.discountTarget.innerHTML = `<strong class="text-danger">Discount: $${discount}.00</strong>`;
    } else {
      this.discountTarget.innerHTML = "Discount: $0.00";
    }

    this.finalPriceTarget.innerHTML = `<strong>Total: $${finalPrice}</strong>`

  }
}
