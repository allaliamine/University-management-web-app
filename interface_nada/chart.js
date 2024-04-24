const today = new Date();
const todayString = today.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric' });

const fourDaysBefore = new Date(today);
fourDaysBefore.setDate(today.getDate() - 4);
const fourDaysBeforeString = fourDaysBefore.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric' });

const threeDayBefore = new Date(today);
threeDayBefore.setDate(today.getDate() - 3);
const threeDayBeforeString = threeDayBefore.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric' });

const twoDaysBefore = new Date(today);
twoDaysBefore.setDate(today.getDate() - 2);
const twoDaysBeforeString = twoDaysBefore.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric' });

const oneDayBefore = new Date(today);
oneDayBefore.setDate(today.getDate() - 1);
const oneDayBeforeString = oneDayBefore.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric' });

const xValues = [fourDaysBeforeString, threeDayBeforeString, twoDaysBeforeString, oneDayBeforeString, todayString];
const yValues = [300, 100, 300, 250, 500];


new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill:false,
      pointRadius:4,
      backgroundColor: "#10504f",
      borderColor:"black",
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "Statistiques d'accès à eServices"
    }
  }
});

