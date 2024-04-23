// Data representing number of tasks completed each day (hypothetical)
const data = [
    { date: '5/04', value: getRandomValue() },
    { date: '6/04', value: getRandomValue() },
    { date: '7/04', value: getRandomValue() },
    { date: '8/04', value: getRandomValue() },
    { date: '9/04', value: getRandomValue() },
    { date: '10/04', value: getRandomValue() },
    { date: '11/04', value: getRandomValue() },
    { date: '12/04', value: getRandomValue() },
];

// Function to get a random integer between 50 and 200 (for demo purposes)
function getRandomValue() {
    return Math.floor(Math.random() * (200 - 50 + 1)) + 50;
}

// Get the canvas element and 2D rendering context
const canvas = document.getElementById('myAreaChart');
const ctx = canvas.getContext('2d');

// Chart properties
const chartWidth = canvas.width;
const chartHeight = canvas.height;
const yAxisLabelWidth = 80; // Increased width for y-axis labels
const xAxisLabelHeight = 40; // Increased height for x-axis labels

// Fixed grading interval for y-axis labels
const yGradingInterval = 50;

// Function to draw the line chart
function drawLineChart() {
    ctx.clearRect(0, 0, chartWidth, chartHeight);

    // Determine the maximum value in data for scaling purposes
    const maxValue = 200; // Assuming fixed max value for y-axis labels

    // Draw x-axis and y-axis lines
    ctx.strokeStyle = 'black';
    ctx.lineWidth = 2;

    // X-axis
    ctx.beginPath();
    ctx.moveTo(yAxisLabelWidth, chartHeight - xAxisLabelHeight);
    ctx.lineTo(chartWidth, chartHeight - xAxisLabelHeight);
    ctx.stroke();

    // Y-axis
    ctx.beginPath();
    ctx.moveTo(yAxisLabelWidth, 0);
    ctx.lineTo(yAxisLabelWidth, chartHeight - xAxisLabelHeight);
    ctx.stroke();

    // Draw y-axis labels (values)
    ctx.textAlign = 'right';
    ctx.font = '25px Arial'; // Customize font size for y-axis labels
    for (let i = 0; i <= maxValue; i += yGradingInterval) {
        const y = chartHeight - xAxisLabelHeight - (i / maxValue) * (chartHeight - xAxisLabelHeight);
        ctx.fillText(i.toString(), yAxisLabelWidth - 10, y);
    }

    // Draw x-axis labels (days) and plot data points with curved line
    ctx.textAlign = 'center';
    ctx.fillStyle = 'blue';
    ctx.lineWidth = 4;

    // Draw curved line connecting data points using Bézier curves
    ctx.beginPath();
    data.forEach((item, index) => {
        const x = yAxisLabelWidth + (index * (chartWidth - yAxisLabelWidth) / (data.length - 1));
        const y = chartHeight - xAxisLabelHeight - ((item.value - 50) / (maxValue - 50)) * (chartHeight - xAxisLabelHeight);

        if (index === 0) {
            ctx.moveTo(x, y);
        } else {
            const prevX = yAxisLabelWidth + ((index - 1) * (chartWidth - yAxisLabelWidth) / (data.length - 1));
            const prevY = chartHeight - xAxisLabelHeight - ((data[index - 1].value - 50) / (maxValue - 50)) * (chartHeight - xAxisLabelHeight);
            const controlPointX = (prevX + x) / 2;
            ctx.bezierCurveTo(controlPointX, prevY, controlPointX, y, x, y);
        }
    });
    ctx.stroke();

    // Draw data points (circles) on top of the curved line
    data.forEach((item, index) => {
        const x = yAxisLabelWidth + (index * (chartWidth - yAxisLabelWidth) / (data.length - 1));
        const y = chartHeight - xAxisLabelHeight - ((item.value - 50) / (maxValue - 50)) * (chartHeight - xAxisLabelHeight);

        // Draw data point (circle)
        ctx.beginPath();
        ctx.arc(x, y, 5, 0, Math.PI * 2);
        ctx.fill();

        // Draw x-axis label (day)
        ctx.fillText(item.date, x, chartHeight - 10);
    });
}

// Call the drawLineChart function to render the chart
drawLineChart();
