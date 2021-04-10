window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);

   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const add = document.getElementById("profit");
    add.innerHTML = Math.floor(inputValue * 0.9 );
})


});