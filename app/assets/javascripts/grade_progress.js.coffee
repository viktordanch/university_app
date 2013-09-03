window.plot_grade_progress = (course_name, data)->
   $('#grade_progress_chart').highcharts({

      title: {
          text: "#{course_name} Progress",
      },
      xAxis: {
         type: "datetime"
      },
      yAxis: {
          plotLines: [{
              value: 0,
              width: 1,
              color: '#808080'
          }]
      },
      tooltip: {
          valueSuffix: '%'
      },
      series: [{
          name: 'grades',
          data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
      }]
   });
   return
