$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $("a.show_courses").on("click", function(e) {
    e.preventDefault();
    let id = $(this).attr("data-id")

    $.get("/semesters/" + id + "/courses.json").success(function(json) {
      // debugger
    $(".courses").html("")

    json.forEach(function(course) {
      // debugger
      $(".courses").append("<h2>" + course.name + "</h2>")
    })
    })

  })

  //clicking on Next button
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    let id = $(this).attr("data-id")
    // debugger
    let nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/semesters/" + id + "/courses/" + nextId + ".json").success(function(course) {
      // debugger
      $("div.next").html(course.name)
    })

  })

  // show all semesters in course catalog
    $(".all_semesters").on("click", function(e) {
      e.preventDefault();
      $.get("/semesters.json").success(function(json) {
        var $ol = $("div.semesters ol")
        $ol.html("") // empty the ol
        $("div.welcome").html("") //empty the welcome main page
        // debugger
        // var jsonKeys = Object.keys(json);
        json.forEach(function(semester) {
          // debugger
          $ol.append("<li>" + semester.name + "</li>");
        })
      })


    })
}


//Submit assignments via ajax
$(function() {
  $("#new_assignment").on("submit", function(e) {
    e.preventDefault();
    // url = $(this).url
    var action = $(this).attr('action')
    let id = $(this).attr("data-id")
    let values = $(this).serialize();
    // debugger
    let posting = $.post("/assignments", values);

    posting.done(function(data) {

      // debugger
      const newAssignment = new Assignment(data)
      let assignmentHtml = newAssignment.formatIndex()
      debugger
      // $("#assignmentName").append(newAssignment["name"])

      $("#assignmentName").append(assignmentHtml)
    })


  })
})

function Assignment(assignment) {
  this.id = assignment.id;
  this.name = assignment.name
  this.description = assignment.description
  this.date = assignment.date
  this.status = assignment.status
}

Assignment.prototype.formatIndex = function() {
  let assignmentHTML = `<h1>${this.name}</h1>`
  return assignmentHTML
}




// create Grade
// function grade(g)

// //ajax
// const bindClickHandlers = () => {
//   $("a.show_courses").on("click", function(e) {
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).success(function(response){
//       $("div.courses").html(response)
//     })
//     e.preventDefault()
//   })
// }
// $(document).ready(function() {
//   $(".all_semesters").on("click", function(e) {
//
//     e.preventDefault();
//     fetch(`/semesters.json`)
//     .then(res => json())
//     .then(semesters => {
//       $('div.semesters').html('hi')
//       semesters.forEach(sem => {
//       //   console.log(sem)
//       // })
//     })
//   })
// })
// })
