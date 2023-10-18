const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");
priceInput.addEventListener("input", () => {
   const inputValue = parseFloat(priceInput.value);

   const taxValue = Math.floor(inputValue * 0.1);
   addTaxDom.innerHTML = taxValue;

   const profitValue = Math.floor(inputValue - taxValue);
   profit.innerHTML = profitValue;
})