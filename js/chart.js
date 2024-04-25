document.addEventListener('DOMContentLoaded', () => {
    const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
    const data = {
      labels: labels,
      datasets: [{
        label: 'My First Dataset',
        data: [65, 59, 80, 81, 56, 55, 40],
        fill: false,
        borderColor: '#4BC0C0',
        tension: 0.1,
      }]
    };

    const config = {
      type: 'line',
      data: data,
    };

    const ctx = document.getElementById('myChart').getContext('2d');
    new Chart(ctx, config);
  });