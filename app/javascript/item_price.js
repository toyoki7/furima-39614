const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = parseFloat(priceInput.value); // 文字列から数値に変換
   
   const addTaxDom = document.getElementById("add-tax-price");
   const taxValue = Math.floor(inputValue * 0.1); // 小数点を切り捨て
   addTaxDom.innerHTML = taxValue;

   const profit = document.getElementById("profit");
   const profitValue = Math.floor(inputValue - taxValue); // 小数点を切り捨て
   profit.innerHTML = profitValue;

   console.log(inputValue);
})