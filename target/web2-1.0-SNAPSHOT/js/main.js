// change R-value input in form
$('.main__btns button').on("click", function (e) {
    e.preventDefault();
    let btnValue = $(this).attr('data-value');
    $('.main__btns button').removeClass("active");
    $(this).addClass("active");
    $('.main__btns input').val(btnValue);
});
$('input[name="coordR"]').on('change', function(){
    clearCanvas();
    draw();
});

function validateForm() {
    let errors = 0;

    // validateX
    if ($('.main__input-select').val() != 7) {
        $('.main__input-select').removeClass("error");
    } else {
        $('.main__input-select').addClass("error");
        errors = 1;
    }

    // validateY
    const Y_MIN = -5;
    const Y_MAX = 5;
    let yVal = $('.main__input-text').val();
    if (isNum(yVal)) {
        if (yVal >= Y_MIN && yVal <= Y_MAX) {
            $('.main__input-text').removeClass('error');
        } else {
            $('.main__input-text').addClass('error');
            errors = 1;
        }
    } else {
        $('.main__input-text').addClass('error');
        errors = 1;
    }

    // validateR
    if ($('.main__input-hidden').val() != 0) {
        $('.main__btns button').removeClass('error');
    } else {
        $('.main__btns button').addClass('error');
        errors = 1;
    }

    // return result
    if (errors == 0) {
        return true;
    } else {
        return false;
    }

}


function isNum(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
$( document ).ready(function() {
    draw();
});

/*canvas*/
let dash = 5;
let step = 43;
let canvas = document.getElementById("canvas"),
    context = canvas.getContext("2d");
    canvas.width = 440;
    canvas.height = 440;
let width = canvas.width;
let height = canvas.height;
canvas.addEventListener('mousedown', event => clickOnChart(canvas, event));
function draw() {
    drawAXIS();
    drawPoints();
    console.log($('input[name="coordR"]:checked').val());
    if ($('input[name="coordR"]:checked').val() == 0) {
        return false;
    }
    let valR = $('input[name="coordR"]:checked').val() * step;
    drawRectangle(valR);
    drawTriangle(valR);
    drawCircle(valR);
}
function drawTriangle(valR) {
    context.fillStyle = 'blue';
    context.globalAlpha = 0.4;
    context.beginPath();
    context.moveTo((width / 2) - valR, height / 2);
    context.lineTo(width / 2, (height + valR) / 2);
    context.lineTo(width / 2, height / 2);
    context.fill();
}

function drawCircle(valR) {
    context.beginPath();
    context.fillStyle = 'blue';
    context.strokeStyle = 'blue';
    context.globalAlpha = 0.4;
    context.arc(width / 2, height / 2, valR/2, 0, Math.PI /2);
    context.lineTo(width / 2, height / 2)
    context.fill();
    context.stroke();
}

function drawRectangle(valR) {
    context.fillStyle = 'blue';
    context.strokeStyle = 'blue';
    context.globalAlpha = 0.4;
    context.beginPath();
    context.fillRect((width / 2) - valR, (height / 2) - valR/2, valR, valR/2);

}

function drawAXIS() {
    context.strokeStyle = 'black';
    context.fillStyle = 'black';
    context.globalAlpha = 1.0;
    context.beginPath();
    context.moveTo(width / 2, 0);
    context.lineTo(width / 2, height);
    context.stroke();
    context.beginPath();
    context.moveTo(0, height / 2);
    context.lineTo(width, height / 2);
    context.stroke();
    context.strokeText("Y", 240, 10);
    context.strokeText("X", 500, height / 2 - 10);
    context.stroke();
    //draw x-dash
    for (let i = -5; i <= 5; i++) {
        context.beginPath();
        let x = width / 2 + step * i;
        context.moveTo(x, height / 2 + dash);
        context.lineTo(x, height / 2 - dash);
        if (i !== 0) {
            context.fillText(i.toString(), x - dash / 2, height / 2 + 3 * dash);
        }
        context.stroke();
    }

    //draw y-dash
    for (let i = -5; i <= 5; i++) {
        context.beginPath();
        let y = height / 2 + step * i;
        context.moveTo(width / 2 + dash, y);
        context.lineTo(width / 2 - dash, y);
        if (i !== 0) {
            context.fillText((-i).toString(), width / 2 + dash, y + dash);
        }
        context.stroke();
    }
}

function clearCanvas() {
    // Сохраняем текущую матрицу трансформации
    context.save();
// Используем идентичную матрицу трансформации на время очистки
    context.clearRect(0, 0, canvas.width, canvas.height);
// Возобновляем матрицу трансформации
    context.restore();
}

function drawPoints() {
    let Xs = Array.from(document.getElementsByClassName("x-point")).map(v => v.innerHTML);
    let Ys = Array.from(document.getElementsByClassName("y-point")).map(v => v.innerHTML);
    let Rs = Array.from(document.getElementsByClassName("r-point")).map(v => v.innerHTML);
    for (let i = 0; i < Xs.length; i++) {
        drawShoot(Xs[i], Ys[i], Rs[i])
    }
}

function drawShoot(x, y, r) {
    let canvas = document.getElementById('canvas');
    let chart = canvas.getContext('2d');
    let color;
    if (checkArea(x, y, r) === 'Да') {
        color = 'green';
    } else {
        color = 'red';
    }
    chart.beginPath();
    chart.arc(canvas.width / 2 + x * step, canvas.height / 2 - y * step, dash, 0, Math.PI * 2);
    chart.fillStyle = color;
    chart.strokeStyle = color;
    chart.globalAlpha = 0.45;
    chart.fill();
    chart.stroke();
}

function checkArea(x, y, r) {
    return (checkRectangle(x, y, r) || checkTriangle(x, y, r) || checkCircle(x, y, r)) ? 'Да' : 'Нет';
}

function checkRectangle(x, y, r) {
    return x <= 0 && y >= 0 && y <= r/2 && x >= -r;
}

function checkTriangle(x, y, r) {
    return y >= -(r / 2 + 0.5 * x) && x <= 0 && y <= 0;
}

function checkCircle(x, y, r) {
    return (x * x + y * y) <= (r/2) * (r/2) && x >= 0 && y <= 0;
}


$('.main__form').on('submit', function (e) {
    if (!validateForm()) {
        e.preventDefault();
    };
});

function clickOnChart(canvas, event) {
    let rect = canvas.getBoundingClientRect();
    let width = canvas.width;
    let height = canvas.height;
    let x = (event.clientX - rect.left - width / 2) / step;
    let y = (height / 2 - event.clientY + rect.top) / step;
    let r = $("input[name='coordR']").val();
    x = x.toFixed(2).replace(".00", "");
    y = y.toFixed(2).replace(".00", "");
    if (isValid(x, y, r)) {
        $("input[name='coordX']").val(x);
        $("input[name='coordY']").val(y);
        $(".main__form").find('.main__form-submit').click();
    }
}
function isValid(x, y, r) {
    return (x >= -3 && x <= 5) && (y >= -5 && y <= 5) && (r >= 1 && r <= 5);
}