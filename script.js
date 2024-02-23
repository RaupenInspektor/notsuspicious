import { promises as fs } from 'fs';

async function sendPostRequest() {
    try {
        // Read the URL from the file
        const url = await fs.readFile('url.txt', 'utf8');

        // Read the data from 'login.txt'
        const data = await fs.readFile('login.txt', 'utf8');

        // Send a POST request to the URL
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                // Replace the placeholder with the data from 'login.txt'
                data
            })
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const result = await response.json();
        console.log(result);
    } catch (error) {
        console.log('There was an error!', error);
    }
}

sendPostRequest();