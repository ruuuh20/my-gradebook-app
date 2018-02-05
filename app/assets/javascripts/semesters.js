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

function Assignment(assignment) {
  this.id = assignment.id;
  this.name = assignment.name
  this.description = assignment.description
  this.date = assignment.date
  this.status = assignment.status
  this.user_id = assignment.user_id
}

Assignment.prototype.formatIndex = function() {
  // console.log(this)
  let html = ""
  html = `<h1>${this.name}</h1>` +
          `<h3>${this.description}</h3>` +
          `<h3>Course id: ${this.course_id}</h3>` +
          `<h3>Due date: ${this.date}</h3>`


  $("#assignmentName").append(html)
}


//Submit assignments via ajax
$(function() {
  $("#new_assignment").on("submit", function(e) {
    e.preventDefault();
    // url = $(this).url
    var action = $(this).attr('action') + ".json"
    let id = $(this).attr("data-id")
    let values = $(this).serialize();
    // debugger

    //using low-level ajax instead of $.post
    $.ajax({
      url: action,
      data: values,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      // console.log(json)
      // html = ""
      // html += "<li>" + json.name + "</li>"

      const newAssignment = new Assignment(json)
      // console.log(newAssignment)
      newAssignment.formatIndex();
      // debugger
      // $("#assignmentName").append(newAssignment["name"])

    })
    .error(function() {
      console.log("error")
    })
    // debugger
    // let posting = $.post("/assignments", values);
    //
    // posting.done(function(data) {
    //
    //   // debugger
    //   const newAssignment = new Assignment(data)
    //   console.log(newAssignment)
    //   let assignmentHtml = newAssignment.formatIndex()
    //   // debugger
    //   // $("#assignmentName").append(newAssignment["name"])
    //
    //   $("#assignmentName").append(assignmentHtml)
    // })
  })
})






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
