/**
 * 인덱스 페이지를 위한 자바스크립트 기능
 */

function clickedBtn() {
    // 로딩 표시
    showLoading();
    // 로딩 숨기기(2초 후)
    setTimeout("hideLoading()", 2000);
}

function showLoading() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth = window.document.body.clientWidth;

    //화면에 출력할 마스크를 설정해줍니다.
    var mask = "<div id='mask' style='position:absolute; z-index:1000; background-color:#000000; left:0; top:0;'></div>";

    //화면에 레이어 추가
    $('body')
        .append(mask)

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
        'width': maskWidth
        , 'height': maskHeight
        , 'opacity': '0.3'
    });

    $("#roadingStatus").show();
}

function hideLoading() {
    $("#mask").remove();
    $("#roadingStatus").hide();
}

// 문서 로드 완료 시 실행
$(document).ready(function () {
    // 스크롤 이벤트 감지
    $(window).scroll(function () {
        $('.fade-in-section').each(function () {
            var position = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();

            if (scroll > position - windowHeight + 100) {
                $(this).addClass('visible');
            }
        });
    });

    // 페이지 로드 시 한 번 실행
    $(window).scroll();

    // 캐러셀에 인디케이터 추가
    var carouselItems = $('#carouselExampleIndicators .carousel-inner .carousel-item').length;
    var indicators = '<div class="carousel-indicators">';

    for (var i = 0; i < carouselItems; i++) {
        var active = i === 0 ? 'active' : '';
        indicators += '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="' + i + '" class="' + active + '" aria-current="' + (i === 0 ? 'true' : 'false') + '" aria-label="Slide ' + (i + 1) + '"></button>';
    }

    indicators += '</div>';
    $('#carouselExampleIndicators').append(indicators);

    // 캐러셀 컨트롤 추가
    var controls = '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">' +
        '<span class="carousel-control-prev-icon" aria-hidden="true"></span>' +
        '<span class="visually-hidden">Previous</span>' +
        '</button>' +
        '<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">' +
        '<span class="carousel-control-next-icon" aria-hidden="true"></span>' +
        '<span class="visually-hidden">Next</span>' +
        '</button>';
    $('#carouselExampleIndicators').append(controls);
}); 