import App from './App';
import {dbank_backend} from '../../declarations/dbank_backend'
import './index.scss';

window.addEventListener('load', async () => {
    const currentAmount = await dbank_backend.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});

document.querySelector("form").addEventListener("submit", async (event) => {
    event.preventDefault();

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    await dbank_backend.topUp(inputAmount);

    const currentAmount = await dbank_backend.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

    document.getElementById("input-amount").value = "";
    button.removeAttribute("disabled");
})

const app = new App();
