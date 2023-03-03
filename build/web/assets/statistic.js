/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global Utils */

function genrateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r}, ${g}, ${b})`;
}

function cateChart(id, cateLabels = [], cateInfo = []) {
    let colors = [];
    for (let i = 0; i < cateInfo.length; i++)
        colors.push(genrateColor());

    const data = {
        labels:  cateLabels,
        datasets: [{
                label: 'quantity',
                data: cateInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };
    const config = {
        type: 'doughnut',
        data: data
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}

function cateChart1(id, cateLabels = [], cateInfo = []) {
    const data = {
        labels: cateLabels,
        datasets: [{
                label: 'Quantity',
                data: cateInfo,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }]
    };
    const config = {
        type: 'line',
        data: data
    };
    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}