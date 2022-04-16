function profitCalculation() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit")
    const tax = 0.1;
    const taxFee = Math.floor(inputValue * tax);
    addTaxDom.innerHTML = taxFee;
    profitDom.innerHTML = inputValue - taxFee;
  });
}

window.addEventListener('load', profitCalculation)
