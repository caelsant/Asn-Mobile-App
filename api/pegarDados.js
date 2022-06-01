// api url
const api_url = "https://192.168.0.102/api/produtos";
  
// Defining async function
async function getapi(url) {
    
    // Storing response
    const response = await fetch(url);
    
    // Storing data in form of JSON
    var data = await response.json();
    console.log(data);
    if (response) {
        hideloader();
    }
    show(data);
}
// Calling that async function
getapi(api_url);

function show(data) {
    console.log("Produto(idProduto:" + data + ", quantidadeProduto:" + data + ", precoProduto:" + data + "),");
}
