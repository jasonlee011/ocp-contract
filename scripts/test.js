const ethers = require("ethers")
const address = "0x2be50af0313c01cd5c96a053e7d332db911f72a3"

const main = async () => {
    const provider = new ethers.providers.JsonRpcProvider("https://bsc-dataseed.binance.org/");
    let balance = await provider.getBalance(address);
    console.log(address, "balance: ", balance);
    console.log('trans', trans)
}

main();