<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
 
<script LANGUAGE="JavaScript">
var caution = false
function setCookie(name, value, expires, path, domain, secure) {
        var curCookie = name + "=" + escape(value) +
                ((expires) ? "; expires=" + expires.toGMTString() : "") +
                ((path) ? "; path=" + path : "") +
                ((domain) ? "; domain=" + domain : "") +
                ((secure) ? "; secure" : "")
        if (!caution || (name + "=" + escape(value)).length <= 4000)
                document.cookie = curCookie
        else
                if (confirm("Cookie exceeds 4KB and will be cut!"))
                        document.cookie = curCookie
}
function getCookie(name) {
        var prefix = name + "="
        var cookieStartIndex = document.cookie.indexOf(prefix)
        if (cookieStartIndex == -1)
                return null
        var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length)
        if (cookieEndIndex == -1)
                cookieEndIndex = document.cookie.length
        return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex))
}
function deleteCookie(name, path, domain) {
        if (getCookie(name)) {
                document.cookie = name + "=" +
                ((path) ? "; path=" + path : "") +
                ((domain) ? "; domain=" + domain : "") +
                "; expires=Thu, 01-Jan-70 00:00:01 GMT"
        }
}
function fixDate(date) {
        var base = new Date(0)
        var skew = base.getTime()
        if (skew > 0)
                date.setTime(date.getTime() - skew)
}
function initCookie(monthName) {
        var text = ""
        for (var i = 1; i <= 31; ++i) {
                text += "^" + i + "^"
        }
        var now = new Date()
        fixDate(now)
        now.setTime(now.getTime() + 1000 * 60 * 60 * 24 * 31)
        setCookie(monthName + "Calendar", text, now)
}
function getSpecificReminder(num, monthName) {
        var prefix = "^" + num + "^"
        var totalCookie = getCookie(monthName + "Calendar")
        var startIndex = totalCookie.indexOf(prefix, 0)
        var startData = totalCookie.indexOf("^", startIndex + 1) + 1
        if (num == 31)
                var endData = totalCookie.length
        else
                var endData = totalCookie.indexOf("^", startData)
        return totalCookie.substring(startData, endData)
}
function setSpecificReminder(num, monthName, newValue) {
        var prefix = "^" + num + "^"
        var totalCookie = getCookie(monthName + "Calendar")
        var startIndex = totalCookie.indexOf(prefix, 0)
        var startData = totalCookie.indexOf("^", startIndex + 1) + 1
                if (num == 31)
                var endData = totalCookie.length
        else
                var endData = totalCookie.indexOf("^", startData)
        var now = new Date()
        fixDate(now)
        now.setTime(now.getTime() + 1000 * 60 * 60 * 24 * 31)
        setCookie(monthName + "Calendar", totalCookie.substring(0, startData) + newValue + totalCookie.substring(endData, totalCookie.length), now)
}
function getInput(num, monthName) {
        if (!getCookie(monthName + "Calendar"))
                initCookie(monthName)
        var newValue = prompt("Enter reminder for current date:", getSpecificReminder(num, monthName))
        if (newValue)
                setSpecificReminder(num, monthName, newValue)
}
function getTime() {
        var now = new Date()
        var hour = now.getHours()
        var minute = now.getMinutes()
        now = null
        var ampm = ""
        if (hour >= 12) {
                hour -= 12
                ampm = "PM"
        } else
                ampm = "AM"
        hour = (hour == 0) ? 12 : hour
        if (minute < 10)
                minute = "0" + minute
        return hour + ":" + minute + " " + ampm
}
function leapYear(year) {
        if (year % 4 == 0)
                return true
        return false
}
function getDays(month, year) {
        var ar = new Array(12)
        ar[0] = 31
        ar[1] = (leapYear(year)) ? 29 : 28 // February
        ar[2] = 31
        ar[3] = 30
        ar[4] = 31
        ar[5] = 30
        ar[6] = 31
        ar[7] = 31
        ar[8] = 30
        ar[9] = 31
        ar[10] = 30
        ar[11] = 31
        return ar[month]
}
function getMonthName(month) {
        var ar = new Array(12)
        ar[0] = "һ��"
        ar[1] = "����"
        ar[2] = "����"
        ar[3] = "����"
        ar[4] = "����"
        ar[5] = "����"
        ar[6] = "����"
        ar[7] = "����"
        ar[8] = "����"
        ar[9] = "ʮ��"
        ar[10] = "ʮһ��"
        ar[11] = "ʮ����"
        return ar[month]
}
function setCal() {
        var now = new Date()
        var year = now.getYear()
        var month = now.getMonth()
        var monthName = getMonthName(month)
        var date = now.getDate()
        now = null
        var firstDayInstance = new Date(year, month, 1)
        var firstDay = firstDayInstance.getDay()
        firstDayInstance = null
        var days = getDays(month, year)
        drawCal(firstDay + 1, days, date, monthName, year)
}
function drawCal(firstDay, lastDate, date, monthName, year) {
        var headerHeight = 50
        var border = 0
        var cellspacing = 1
        var headerColor = "midnightblue"
        var headerSize = "+1"
        var colWidth = 60
        var dayCellHeight = 25
        var dayColor = "darkblue"
        var cellHeight = 40
        var todayColor = "red"
        var timeColor = "purple"
        var text = ""
        text += '<CENTER>'
        text += '<TABLE BORDER=' + border + '  CELLSPACING=' + cellspacing + '>'
        text +=         '<TH COLSPAN=7 HEIGHT=' + headerHeight + '>'
        text +=                 '<FONT COLOR="' + headerColor + '" SIZE=' + headerSize + '>'
        text +=                         monthName + ' ' + year
        text +=                 '</FONT>'
        text +=         '</TH>'
        var openCol = '<TD WIDTH=' + colWidth + ' HEIGHT=' + dayCellHeight + '>'
        openCol += '<FONT COLOR="' + dayColor + '">'
        var closeCol = '</FONT></TD>'
        var weekDay = new Array(7)
        weekDay[0] = "������"
        weekDay[1] = "����һ"
        weekDay[2] = "���ڶ�"
        weekDay[3] = "������"
        weekDay[4] = "������"
        weekDay[5] = "������"
        weekDay[6] = "������"
        text += '<TR ALIGN="center" VALIGN="center">'
        for (var dayNum = 0; dayNum < 7; ++dayNum) {
                text += openCol + weekDay[dayNum] + closeCol
        }
        text += '</TR>'
        var digit = 1
        var curCell = 1
        for (var row = 1; row <= Math.ceil((lastDate + firstDay - 1) / 7); ++row) {
                text += '<TR ALIGN="right" VALIGN="top">'
                for (var col = 1; col <= 7; ++col) {
                        if (digit > lastDate)
                                break
                        if (curCell < firstDay) {
                                text += '<TD></TD>';
                                curCell++
                        } else {
                                if (digit == date) {
                                        text += '<TD HEIGHT=' + cellHeight + '>'
                                        text += '<FONT COLOR="' + todayColor + '">'
                                        text += '<a href="javascript:getInput(' + digit + ', \'' + monthName + '\')" onMouseOver="window.status = \'Store or retrieve data for ' + monthName + ' ' + digit + '\'; return true"><FONT COLOR="' + todayColor + '">' + digit + '</FONT></A>'
                                        text += '<BR>'
                                        text += '<FONT COLOR="' + timeColor + '" SIZE=2>'
                                        text += '<CENTER>' + getTime() + '</CENTER>'
                                        text += '</FONT>'
                                        text += '</TD>'
                                } else
                                        text += '<TD HEIGHT=' + cellHeight + '><a href="javascript:getInput(' + digit + ', \'' + monthName + '\')" onMouseOver="window.status = \'Store or retrieve data for ' + monthName + ' ' + digit + '\'; return true">' + digit + '</A></TD>'
                                digit++
                        }
                }
                text += '</TR>'
        }
        text += '</TABLE>'
        text += '</CENTER>'
        document.write(text)
}
setCal()
</script>
 