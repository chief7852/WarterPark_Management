var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');




/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
//    var eventId = 1 + Math.floor(Math.random() * 1000);
//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
//            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: ename,
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false,
            emp_id: EmpVO
        };
        
        
        
        if (eventData.start > eventData.end) {
           
            Swal.fire('끝나는 날짜가 앞설 수 없습니다.')
            return false;
        }

        if (eventData.title === '') {
           
            Swal.fire('일정명은 필수입니다.')
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');
        console.log(eventData)
        //새로운 일정 저장
        $.ajax({
            type: "POST",
            url: WCP+"/emp/calender",
            data: JSON.stringify(eventData),
            contentType : "application/json; charset=utf-8",
            success: function (response) {
            	if(response == "Fail"){
            		location.reload();
            	}else{
            		Swal.fire('근무 신청완료')
            	}
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};