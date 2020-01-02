<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>

<head>
    <meta charset="utf-8">
    <title>填写工单信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>

<%--<blockquote class="layui-elem-quote layui-text" style="background-color: #33DF83;color:white;">--%>
<%--    本模块实现员工信息的维护，在员工信息更新时,务必确保数据的准确性和合法性。--%>
<%--</blockquote>--%>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>确认工单信息</legend>
</fieldset>

<form class="layui-form" action="" id="courseform">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">工单编号</label>
            <div class="layui-input-inline">
                <input type="text" name="workorderid" lay-verify="required" autocomplete="off" class="layui-input" value="${workOrder.workorderid}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">保修卡编号</label>
            <div class="layui-input-inline">
                <input type="text" name="kcm" lay-verify="required" autocomplete="off" class="layui-input" value="${workOrder.aftersalecardid}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">问题类型</label>
            <div class="layui-input-inline">
                <select name="questionType" lay-verify="required">
                    <option value="">选择问题类型</option>
                    <option value="退货"${courseInfo.kclx=="退货"?"selected":""}>退货</option>
                    <option value="换货"${courseInfo.kclx=="换货"?"selected":""}>换货</option>
                    <option value="维修" ${courseInfo.kclx=="维修"?"selected":""}>维修</option>
                    <option value="服务预约"${courseInfo.kclx=="专业选修课"?"selected":""}>服务预约</option>
                    <option value="补发商品"${courseInfo.kclx=="集中实践课"?"selected":""}>补发商品</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">问题描述</label>
                    <div class="layui-input-inline">
                        <textarea  type="text" name="question" lay-verify="required|number" autocomplete="off" class="layui-input" value="1">${workOrder.question}</textarea>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">问题描述图片</label>
                <div class="layui-input-inline">
                    <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUSExIWFhUXFxoXGBgXFxgaHRoXHx4bGh0YFxsdHSggGh0lHxodITEhJSkrLi4uHR8zODMtNygtLisBCgoKDg0OGRAQGy0mICUtMDcwKystMTA3LTErLS0uKy0uLy8tLS8rLSstKy0rLy0rMCstLSsvLS8tMTAtLzctLf/AABEIAKgBKwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAQUGAgMEBwj/xABEEAACAgEDAgQDBgQDBAgHAAABAgMRAAQSIQUxBhMiQQdRYRQjMnGB8EJSkaFicrEVM5LBCCRDU4LR4fEWFzRjoqPC/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAECAwQF/8QAMBEAAgIBAgUCBQQBBQAAAAAAAAECEQMSIQQxQWHwE1GBkaGxwSJx0fEUBSMyQuH/2gAMAwEAAhEDEQA/APXduMDHWO8tIggMZrtx+/3/AHyqeNp5443ImRYpNsdFWDJf4irjjsPf+uRnSOqyamVJBKkbquzazIQB6gzbSwZgQob29vzzjLKlLTR9HH/p8p4fW1Kvj5/Rf6zTq9Ska7nNCwva+SQAAPc5HDxBCx8lJl84blO4EAMossRxxxffnOjXQqdsryfdxAyUApHCn1XV8Akijm7TWx5fRlGSWRNfPf8AbbqSBUfusNuc+h1aSxrIn4WAI/UXznReaVHJpp0xBce36Y8V5aIG3EVzK8CcUBbRgFH7rFeMYogEfusRA+WMY8UUxI+n7/pgRjwxQMSMK+mZYhiiCA/LMduZ4Efv/wBMUUwFHGo/ZwAzPFEMSMK5zLDFAxrHWMHDFFFX0wrHjxQAKP2MW3DFigBA+WPZgDjvFANo+WLb9MZOAOKBiExgD5f2wxE/XFArPUvGEcUzQeXIzAqu5Vv1Hjsa7d+LvLLHGAP9Sf8AU55Zq9Y8jea7RyMTdtFcaLyR5jWpZkAO1EIs1ZHOXvQaGSQBppt6OptDVMGA9loAcXtO6ueeTnHHNts+nxnD48aio7e73dvtdfxuZeK3iGnKyjcruibfM8vcWYCt19qsn6A5U38MI0jANSLSiR2DF9/JYLRFqleu+fcWMmup9T0vnsoXfIiUSTaJRC+Wyk+mzVkCuRfbiO8TiOMxxxi2KlN+47TIxO1WBFctu2kGrLDMzUZW+ZrhpZsKjBNxvfflTr3dfz8g03SUkRmeaiFMZUBS5V12AVtWiwph3H6DLfpemKqorW21Qos8CgPYACuPllX8NqA3mQxl2oxuSVFEDuL+dD3Hcj2y1wdQRnMf4XH8LUCfbgXZH1HBzWJKrOXHSnq02357HVtrthWM4s7HzgJwGGFYAFcRGZYYBjWFYyMMAWPC8MAWLMiMKygwGBzOsNuQGF492M4sALw3YsYygRx5kBgBgGFYxmdZjWQDxY6wwBYVjvAYAiMdYxhWAFYrxnFWAFYYYVgHjun6Yvn3o2ELWfJjYboywAY3GbCWDXoFjuQ3N2Ho0B1U+8zzJJGFWWIqTIj0QRvFIgK1tKgGrN80L9sRj2UspB9iQ3sfochfEXhddSd6TSaeUgI8kJAMkY52P8/oe4v5EjOSx++578nGXWhadq8/f2KrP06LzplTzXBS72GXe2+mDsPxciqbmgee1d/gzQs00juopFVCrbmaNxzsBkZivBr0mqrtlv6f0uKGvLQAhdu6hZF3yffnnOlI1F7VAs7jQAs/M/X64WOnYfGtwcGr2STfShR6dV3FVALG2I9z2s5rMaOQxAYxtwe5Vqo19aOdB5zCGJVFKABd50PFfV8zLFjwrKZAZF+KerfZNHPqdu4xRlgvzPYA/SyL+mSuaNbpEljeKRQyOpVlPupFEYB4z8Nvilqp9cun1bK6TsQm1FXy37gCu6+3Nntznrui6xp5pJIop43ki4kRWBK+3IH7vPKvBnw4Gk6qfOG9EJfTPuIPHILACiQDVX3F5x/DrwZqdJ1twzEJEHO439/G4IWjVE2VYg+4+mCntxGGGMYIY5ljwwBYHHjwBYYxgBgCrDbjwwDBVzKsMeAKsKx4sAWPHhgGORLeI9J9p+x/aI/tH/d7ue118rrmu9Z5h0Hx31HU9YlhRfuQs4EJUDaEVtjkkWGLhBzx6q+WUDwT0bVajqsaerzY5xJO5N7djW5Zh7kivqTgp9R1iGZnFggAY8xx4A8MKwGALC8yrFWAR3TekLAxMZAVu4Kgt8/x9zySebPOSNY8BkSo1KTk7Zwt1WJZDE0iq4IFE13AIo9v0zuyK6r4d0+oYPIh3AVuUlSR8jXcfnkhpdMsahEFAfUn+55OZWrqdsiw6IuDd9U6r4O/wbMeGGbOAYYVhggYYYYAio71mLRAsGobgKBrmuLH9szvMd2ARfiTri6KHz3ileMEBzEoYop7yOCQdg9yLIvtkVL8R+lKm866KqBobmb/AIQpa/pWWeeFXVkcBkYFWBFggiiCPcZ84eNvhRrNNMx00TT6c2yFOWUfyOvckfMd/wC2CnqjfGDpV8TOef8AuZP69svGi1SSoskbh0cBlYGwQeQR9M+Qh4b1m5V+yTgsQouJxZJAAsiu5H9c+m/hn0iXS9NggnFSLv3Dduq3YgX9AQK/PIDs8VS66OMzaPyZCgJaGVSC4HP3bhhtb6EEH6ZDdM8fbumJ1GXTn1SCMpGwJtmCKQWodyPyvLhrFuNxvKek+vg7f8Xq44+vGeHaXSlehI41L7BqY18k7NpImU3+Hd+Ebu/teAe0dT6mIdM+pZGIRN5QVuPb0j2LHsB7nNPhnria3TpqY1Ko/YNVivY0Tz+uVnxdMJ5tHpYJR54Uz7C33bKoG1JAPdmog+20n84zwBE+m6jqtJNJsdx58caPcYElsyKhumRiee5Fe3GAT48dL/1k/Y9QV0sjRzMnlNt28l63gstc8c17Z063xlGsmmSKKSf7UjSQtGVAIWib3kEcMK/PKf4S6WJ36tHJq3Ef2qTzduxfMSqLEgWBwR6SBmGu2PrOjtDK0MTaeRo1qMGJCsZW7BHqHsflxgFq1Xj2NIJpvs2o3adwuohpBJFfZ29W1k5BtSaBs8XXb17q8phg+xsnnah1CbhvGzu7cGvSPc8WQPcZ0dG8OQwiY20ragkyvIdxext59qqhXbKt8KtNGG1QWQuIJpIIQzbtkAZtoX6H+b3454GUF8hBRBvfdtW2Y0LruTXAyhde6h1pFWXpxg1unkG9GZAJQreoCtyq4F8EC67jgnN/xN6wG8rpiyrGdR6p5GYKI9Kv4ySfdh6R+uecfGTxTp5Do4dBOCmnDcxEgKfSqbTxyADyPnkB6N8Out9Wldo+o6MotErNQjo/yFL5v2IHt+uX7KLr/idodPBE7S+eSED+U0ZYGuSVZ1J5+QOWLw34n0muQvppg9fiXsy/5lPI/PtlBh0nw3Fp/PeMffaglpJDyWNUPyUfLH4a8NQaJXESAPId0jAUWI4/QD5DiyT75NVgcEADEBjwwUVYyMROAOCDwwwGAGF4DDAOXVaYuyEPQU2R8/32/rnVhWR3XOrppo/MYEk8Ko7sfl9K+eZdLdnWEZ5XHHFW+iJHAZA+FOqyalZJHoDdS0O3HIHzq8njiMrVoufDLDkeOXNBgThh+/0zRyOXpiSCMeaQXtia7C2JAH5ChnVheGRFlLVJv3A5i2ZXgMpDEjA4SNSk0TQPA7n6D888I8VfFvV6uT7L02J49xKg7d0zn/CBezsfmfqMA9k6x4i0ml/+o1EcR9gzCz+S98pXUPjV02P8Aml/yoAP/wAyMoUPwomWM6zqeqECficXvkP0Zj6Qb97bK34Y6XpNRr3sP9iiSSZ9zeoxIpqyK5LFRQ+eQHq8Xx00JNHT6gDnmoz/AKPmnxV8YQmn3aSNDIwoFpomKX7mNCbP0Jzzr4eeBP8AarakhzAkYBQ1vG5idqG6sBQbN32zr658G+pQkeUqahT7xsFI/NXI/teAWTwB8YiT5HUzuVjQn2gVftKqgDb9QOPf557KmihK8RxlTTcKtH5Ecc9/7/XPlno/gjUTa37DI8UE1gESOL+Z27bDsB/CDn050npH2fRppEckxw+Urt8wK3V7c+3tgEYvXNO0uyDRyT7DzJFHHsBXj0szLuo8WtixWSvTNTpdUo1EXlyC/wAVAkMK4a+Qw449squk6vpIYNKJpho9Rpk2GEqNzekIyKlXKjEAgp3IXnNvwy0zXrNT5D6eHUT7o43BViQX3SkE2N25eOPw/IAkCqfEjxekM2t0kIUA6QpIaAImdlG1DQP4GJI5+fscs/hDUyTaWRmSFhHMYEaULtiiiRVJPFv6gTVj8XcZX/jp4S05gbqChhqN0UZoja1mrYV+KqF38sqHjPpLaDR6bp7STSaia3aNGIi3Ow5NcyOK2gduSfkMAmvDvxY8ubT6Z33wh3ilkcIqCPcyxvHQ3cLtJ3E8WPrnqnhXrOi1aNLoyhCnY1JtYe9EEA0asZ5nq+g9M6bFDp+qaQMrxqy6lFbcZb+8jcoQfTdqfdbHccyXX4Iek9NbW9F2VI6CSS2muP1AFSWpaYjuPfnAIT4jeB0Gsk1mt12zSN6kFl5ix7wxKfrdHsBXHGVf4n+H9HpYtA+kSRRPE0rGQksQdhXcDwp5PYZJ+DPBmt6xOus17yeRYO+TvIO+yIHgJ9QK+WdP/SIYDVaVApAWA16aX8RFKexqu3txgE/P4R6BqGgUltNLqIkmRQ7orKyg0pcFL57A3l48MeC9B0wNJCu1itNLK9nb3qzQAsDgAZFdO8NwdR6HpIJhz9mj2OBzG4Wgy/8AMe4zxLx74V1+hbZqGklgBqOW2KEfKiTsb/Cf74B9DdS8b6KKTyzIztV1FG0g+dblG26579s16Pxeuok8rS6eSQj8TttjRAf5iSW/QLnypDqnUFVYgHvRr9989H+GfiT1w6NPN3yH1EzUrMLK9wSBX8ou/n3AH0RHur1VfvV1f0vMsxiQgAHvX6dvbMsoEcMzrFgGOMZD9Q1GtEjeTBA8QArdMyux7kAbCo+Qs5F+EtVq9U80urhfThJNkUJscAXvYjh+/tx3wC24bvphjGABzRqdMkg2uoYfI/3zbjrI1ZU2naNWl06xqEjUKo7ADjNvvidq5PGAPHB4wG292P8A9sMMZwQQP5/v548xGO8oFX7/ANcBmWKsADlWm0PTulefrNkcLSbndiTbHuQlk7QSfwr3JAq6GTvVupw6aF553CRoLLH/AEHzJ7AfPPl/4i+NH6lqN9FIV4jS74s+pv8AEb/T297gM/iD47m6lKe8cAPojv29meu5+nYf3Mlq+jtouhCZlKy66ZVYkEFdOoZ1W/bcVDe1ivlh8JvATa+YTTKRpYjbEj/eMP8As1+Y/m+nHvntvxK8MDX6CSBeHT72L/OoNL9AQSv64BV/+jzpyOnzOR+PUNX1ASP/AJkj9DnpHVuoJp4ZZ5DSRoXb8gL/AL9s+aPCPxM1vTovs8axNGrMdsiGwx78gg9/neY+NPiZrOoxeRII44twYrGGG4jsGJY2L5r5gfLAKz1fq0mo1MmqdiJHcvYPKm+AD7VwB+Qz6PHVNcItDpI5dONQ8CNqJZ5AzIQi8CLcGd2smzxw355819Kh3zxJt3bpEXb87YCv1z6J+IOlcaz7XBZl0mnjm2j+OLzJhIle/p9Q+qjAOjX6CfYZY/EFOjAMXGmMQf8AkZVA2E/Iknv3ylda0XV+oP8AZ5OqaHyiwNRTxgNtO7dtUbyRV0eOP1yf69qxL0nqE0KKySysxNgeklTu7ern2/XLX4e0LPJHLPpoV2RJ5Minczbgd9mgfZTVfW/kBHa7oS6vo7aSTXxal1A/60WShIG3JuKk+xC2TZBv3zv63BpW6hoy8Dy6lEZoiP8AdolgF2J4LA9gL739RR+p6OTd1DpERKtJMdRFXFRspnABHsJfTlu+H/UPttav2WCOEf5qLPX1BO0/lgEz4g0mh1Y+x6owuSQwiLqJN1GmQAhwavke1+15EdP02j6Ww0MEElS3O5ZgY0UUpd3kah+EcAe35kZfEXpp8kdQiIXUaMGUHtviHMkTcc8Cx8mAzo6Ksj6eTWsgaadLVboLHR2xhj2ABJPzJPzwCVXxDo+ANXpr7ACaL+gG7IT4meF4dfoykkqQtGweOZyAqk0CGJI9LDj86PNVlf8Ahxonm0WiWXTQtpwNxkJtw60UoEDaLvm/lkz8RtaQItM6j7NKGOpK2XSJCpLBRxssiz8varIAnfCGkEOi00IkSXy4lTfGbVqFWp9xedEnUNK7GBpoGZvSYmeNif8ACUvn8qyl/CXqsx08mlkSxpLjXusjAepLRqrcpFcn6kZXOjwNP05tKIFRZ9ZLGJnr7lvMZgAoHpb0kA3QNd+AQLz1H4ZdKmbc2iRT2+7Z4x/wowUf0yV6F4U0Wjr7PpY42AI3gW5B9vMNsbr55KaSLaiIWLFVAJJ7kcWc3HnAEf3+/ngMO2BOALH+/wB/PDDADFjGAwCM6r06aQ7odVJCwH4QsbISP51Zbr8mBzyr/wCcGrjuOXp5MiEq5QsF3AkGhsNCx8zntGKh8h/bAD99syxDEMoOfX6JZVKNdd+DyDmei0wjQIOw7e/fnN4/f9sWZpXZv1JadF7ewHHeK8RGUwM4YVhlAE5i5rn9/v6ZleGAeGfGXVSzCnDUvaJPwRA8B527GQ+yjt9cgPht8L5NfU+oLRab2I/FL/kvsv8Ai/p9PeOpeG4ZlEbj7rfvdB/2rfKQ/wAt8ke9AdrBmI0AAVQAoFAAcAewArtkBq0GhjhjSKJQkaAKqgcAZvwrAjKCg+JvhP0/VytNUkMjsWcxEUx9yVYEAnuSKs/nkMvwJ0Vc6nU//rH/APOer4Ed8gKf4d+HfTtAfOjhLyILDyW7Aj3Qdg31AvNfQeja19fL1DUyCNJE8pdMAGIiFlQ7dg1ksavlmGXM47+uUFbj8FaYaSTRJuWCRixVSRQJ3bQe+28y/wDhRd8Uh1E5MP8Au7kbavFfhujx8wcsRwyAhZfDiHWfbQ7iXYIuK27BfFfmSb+uZeGvDseiRoomYoWLUxHDE2SD9TzWTIzEYBx9a6aupgfTuxCSKVbaaO09x+o4zDp/SRFpxpw7lQuwNfqC1QF/T55IfvtgMAqkfgWJYU06zTCJCCqCRwAQbHvzR9jkhD4cUan7UZZGfZ5dMbXy/wCXb27833/PJvC8Ag9P4bSPVy6tJHWSbaHHG0gAKOOwIA4PfNWh8IwxaeXS73aOUsx3HkOx3F1buG3eoH2Iyw3ivKCueCNTrjGYtbH642ZBKKHmqpoPtHbd3yxk4xgMgFeMDCsP1wAOPERiygMePFeABOL9ceIr8v8AngGEbEgEij7j2H0v3zO8xXGp/f8A5YDMlwrEuZiI/TIDEnD3zMocwvAOPqPVoYK8yQKT2F2x/JRyc26PUrKgdL2nkXx/bIzrPhqHUMHYsre5WvUB2BNf6ZLwQqihVFBQAAPl7Zlard8j0ZFgWKOhvV1vkv2M7w/fGBwAzR5xVjP/AJ4YVgAcBhjAOAK8Pzx4soDGMQHthkAD5YYY8oER+/pgMAcz2nvgGAwrMzHV5ieOcAWPEMMAY+eI4V+/phXvgB+mG7DAdryADgcf7/TMcoGMMKwIyAVY8MMoDAoDjA9ucCn0yA0g/v8AtgMipNNqlj+0eYWcDc+nATyyO5SJtofcBwGJpiOQL45eo+K4Y9gQGVnUOAtABDyGYsaF+w5P0zM8kYR1SdIrjRZBqFVWLEBQLJPYCuSfkMhv9sTN6ooVCH8LzuyFl9iqKjNX+bafpkJ1DxCmpgKBWRhLCHRqNxtKoO0gkMrH0H3G7kCxmMcmo1ryIrrEkNKWZC+6QqG20GWgAQSb/iAHzHny5ZSS9He+vQ9WHFDQ8k3UV58Sw6XrTKwWdAm47VdH3xlj2UkqrIT7bhR7A3ktvBF++ee9M1Rcvp5RV7o5FvsQaJU/3B/I5dOi6hnghdvxNHGzfUlQT/W8nCZp5E1NbovF8OsVNcnyO9U7YmTIbV9Wdt0kbJHErFdzKXZyDRKruUKARVm754AonHQ9ZYEB2V1Yhd6qUKsTSh1LNwTxuBHJAod86f5ONT0XucfQnp1VsTWH798y789hmCspNBgT71X9/lnc40MDH+ucOtln37YYVehuLSSGNebpUKoxZuOeAACO+Y6bqsbRGVj5YWxIJCB5bDhg/twfkaPBBIIwXSyRSiee2cut6tFEwRm9VWFUM7kdrCKC1fWs4tP4h00m7y5VZlUvt9QJA5JAYCx+WV3T9WKxpGkZk1M/rYirZiNxJYkUqg0L4AAGcMuXTG473yO+DA523yXllqg65E7hCzIWPpWWN4yx70odRf6Z3tR5HzyhxdRLF9PqEPcK6NXHYqysp+oIYcj6EEC0dBmZovWdzIzIW49W0kBjXuy0TXuTxnPhuIeRuMlTRviOG9JKV2nyJLGwP1zXJqEjVnfhVFk8n+3+gyNk6xMCB5SKDz95KVf/AIFjZf03/nWejJlhj3k6PPDHKfIlP0wByJglOrdluWJIwFZQdj+aQGssOCoBFbSQbPyznk6t9lEialixj2lGAG6VGJCUBQ8ywVNUOA3pDca1Kr6EcGifBqjkdr+qMXMcCb2QAuzHaiX2DEAktXO0DtVkWLrmm8c+updOqRk1uWbeyj5uvlgVXfaxr65yHXTrcMdCWbUSL6h2t39ZHBKhFB+oA+eeZ8RGcbxOztw2JZG3apL+yxf7R1N3cEtfwLvjP5BmLAn86/MZLdP6ksw3KDXKlWFFWHDKw9iDlD6tpn0kkdzGRJLpmCqyyDkr6QAVIsjixtNk3li8NvumlI/jihZv89yLu/Mqqj8lGceHy5ll9PL80ejNgxvCs2N2ixhCcWw9+O2atS/BjV1WTaWFgsAAQCSAwJ7/ADGQ2snmjUuszykE7UMaMGogEBUVWUE+ncWNE2bz2TyqHM8cMTlyJw8cdsyOR2m6k+8RTwmJ3G5PUHVq7qGAFMBztI7cgmjWer6tp4nCSTRox7KzKD/c50sw4u6JB2CruPy5yLPiXSgf75KB7/w/8Y9P98jOs62Np1ikFwxxiV17h2YsI79mVRG5rsSVPtkZJ4jc1IqSLAx2xyEehj7Ac2Aa4JAB9ibGeTiOIlj/AOKuuZ7MPCOaTe18r69i8I6MAQQQeQQQRX0+eBFH65Vui6gCVNgpJdwZB2WUAtvUe24BtwHcgHvd2gf887YcqywU0efNieOWljvAjOPWdUCNsjQyEUWqgFvtuZiAPyFn6ZxajrxC15RDsQkW4hkZ24FspNV3ogEgGryvLBS03uZWOTV0TBwyH1azabbK0zSwkhZQ6oDHdASR7FHpB/ErXwbsbSG5Oq+Lo4pDGkbSlTTlSqqrfy2Ty3zoEfMjLkywxx1TdLuZaosGs1yRRl5DQFexJJJoBQOWJJAAHJJrIr/aWpPI0wA/xzKrf+JVVgPys5D6zrqz/Z5EsBXcsjd1kVPSGokHhmYEEji/bOKPqvUZrkh06tGWYKTIVJ2kqeNp9wfzzhkyyb/29z148EfT1zaS7shpvELxOu6WXzgVVLZtoCKi7JFuiGYncaJtr9hVT8fagwSB0sQTjzkpj3P4kY/4DxX5ZaZvCeq1rzaiJV8vfIq72KmTkAtHweLU0TV+3HOSGn8MgLFD1MqieuRAWj2oy1yWZSGdtxOy6oMee2dMmKM1Ujyx1Sk1JbefHz3K/wCBOnNqNOJZHkVXdkVgzLthjG+WRqI3gsEj57XffkSTTpEkcQdoRt8xRuIPnykugau5RAo549WTbeFIHgWaacQvIKUMkccZANi46BBZFG4ghqsWBld6/wCGNazLK0alp5HULG97ZK9NlgBQSLhr/wBc1HHGEdMUXJqUajy8+fWzog1Ad55q9TxpLtBrcCg3qh9npGr8s5ND47madEjdmYsFVAF2NzQjVfZT2Dd/e80x6bUJNDsik86MmNowPUNp3JY7VtPfsRfOSHSvAO3VfaIWVZZDKY1LEpBtuOQVttqLEK3FGvpfLJg1SuMmuu3Xz25GvVnlioy/67fI7dHIu4GaFniRQI4m2nzC1sHIvbwiEizzuB+Wa4NaiNILPlb1CdydrbZBQ7naD/bOfxPpNYoPob0EAyRUVtiFQIBzVRxp27lh75EaiGSWBoACJStxgij5qWrxtxahk29+BtW8ZcClH9K3TtHWPGTU5auqrt2+31PRNb4likjBUtsDEyr+E7QrELwexI9jztYe+cDzFHjEkKReYN0ZStyduLAG1hYscg/XnKn0HpR02nvVQlmDEs5U+WpFfdhjXqG11quWkH8ozt8Oa5J51EvChixN/iO1rkJ9i3F/pmMmCeSKcn+rsXFnhjcYzXvf4oscviaZNPCTKqGQzOz7QQqI+wBQeKPp73xfubyq+Mesu0K6pSCpcLKqj7v7Qqjy5u9kNEbAJ4KgXYvOrxLo5JI9Hp4o2aQwMwRR8zG5u+FAvuazi6f0XUBJtPPp3WGQKjmRTQ3OBH5dEbpPMelogC7JFZ3yQ1xcWea251Wzv7kL4T6tLqJiA/8AulaYvtvaq9wAKstYUD/EbvLhp45dM7FpB5vogUhV2wgr5suwVzSLGLa+T/XZ0P4fnTtJBppFjKeWZZfUxlBt1RkNiMigbB9xxkV4p6dqlRhJE5WIffS2rKxkYO8nsxUhQO3Fke2Zw8PDFGollcIOMeT5/fl+Op1z6lpdQkrD1LDJ5pHuIH4YDsLEm6vrWTE/iEaOAlW37yTbqQI5vxSKw4O2iCq9zfespfTtQYo3D7lYUGDhgQrqqrwRdFoR/XNkOgnlSXTzxSjzFBV3RhscH0vbDtZIruQ9D2w8dNyjs2uZp8RKWOGJrZX099/pZOaXxm2oRkY7gGje1jYEFXU0wF8E8g8civfjbLqFaFpnkkOooyqCTtEQ9QiI/CWMfr+fPeuM5fDHhHVaKORYwJGDfevxuDbKHlKD6wqylhdHd7H2h9TrX88KylI2IKqylfS3oRhuF15ZCfLg5lYLjU3qfc0uInhilH3u19v2Jrq3UKjRpATGR94v8+xZHVSPerBr6jIvXak6nSP5QPm6a3iB5cRH0yxKeb2cOv0IHtkzq+ky6qDR6VNvmGNpZWs7Yw4a2b/xNQHc7T8jWWm8CazTu8gdWVULfdFhJIQv4FBFKW4W7Ne3OajhSx+m+RM2SWTNqiv0u+vf8o808Dt9p1ix2Vj5aVgSLjUbm59yaq+/OeiS6SOG5Y1CymIAsKPlvOa2K3/24wx/pk50/wAO6SX7qO/soj3zBSQnnWDw7jeCBvLAMK4urzi13hIz2mkmXyqeT7xGDeYy7ACaFqVJKtR7HvWbhjjBbIzJNKovzzoRqaJ5dKZoYwdIkqyKLKkUCkjIpH4aNk2P4znD1nxBJCW8osYwwbfGzIDwCC5HIKil2dgwYnk8dGq6vJpU0sQHAgQldxoFmcuCBwwPAP0HGQMXSZvtd0zaPkqRZLpRIiCjlmBpXq69RzhxGKU6UPi7rYscsnD0l73XwX8F6j1Hmxq7Q/aJViEkruFYKjWQqA8ex4As1Zzr6H1MJLEsYURGKVzQB2rGB6FPfYWkVgPaj7Gsquo6lHpiiQhgpIbvXyUbx+Sj0+3mHN/hYPvndl2xxaWSJD87kCsf6xnn6fTEcDjkUk/3/B2fE45QlGuXL5b3+CbbxHLqAI28oSsBJDtDXFMBvSOT1HcGFoWG3uRXIrzHV+KGV27WSS5cHc7fxFvl8q9qzvg006ldSIpdrFSsixuQw2pRUgc0ygj51xk1r/AqaiV9dLHR3IskCuUqV6XcWKFSbdSyC657mxlz8PHMkpHlinNaZKvPP7N8Gi1LwoAURWSNPwksqys3lx3uq1DF6r0q/vm/q3U90brtIgZSsAV3FeXWwld20hgu6gorjv3zu6t03XadS8tS2WKeSLrUMohiLDapoISt8iyOFrKjp4ZEnAdHUBthVgRQFIoIPb0tf656sKjja8sxxUpyjGPty606v8c/gWXpsbgABnWRV8xVsnzCw/Ctng7CxFEN2rOefxtTkKbH8NyagFh3BP33oJ71zkXqJNQjL5YcBdu6gSN6BFJs9qKsR/lzVP4Nkl1Y1Sg+Qzq3k9iZT62i5PoQ0aYjsR9Mzc4JRxvbz3sZV/kycns/p9kWE60yyMBM6IS0spuQeklQiAUfUQVWgCf7ZqSdo2liDlvRuR97G72sjAdrBIo0OVzX1lp4lUGMpKSgr8QHcBmYDb6ndm7/AMI/Td4U0rF2eVQVED2D/PvoAD3pScsoRlV9DfrOMpWua5bfPlz2e69yOg8QEMoeSZg6ffqZCVdGH4VuwpC2eB7V7nKt4ilk085gkJFOFWjdqw3B7/iJ7k/nlo03gnWyRrMqIu5VIjZ9rivciqG7tV3/AMpx/DihD9pr7RBEGhHpZdxsrEiFbl5ABa7JYgV3PSfpzcXJcu3/AKeZYcj1Qf388+sJ0vp/3CPLvJkiM23cy7rO2GFl4HrNm+/qHbtnbN1vVwHyNKEMMQESk9yUARifzYNk7rPCcUW2WKZTqAd6xOUVXeqCIFAKc9qsbqNE5Cr4I6mANr6eiAeXcWx5YkFOLYk5iVbaTvGEkqVV0vz69yzpDIupiIErfeJudQyJHEse3y9m4BlZhfpWhuJ9hk71ks+xUZlWzvZAu4cemt4Iq+9C+31wwznrOjbZHxJO6QykgTxrJGwkBAeNyO5W9jny0awDXqFc8bdLG5kR5qqIfdRxhtikgruZ2ouwFgcCgTwbBwwx6nYNsjZIG1Gs8zUwHyEUpDX4t9+p5NpDKtcKD9SaJGboNI6uY23MssciSOqqPTQVDvreXon8TN7n5YYY9TsLfQ2OzoUR1LR7g5EMJALLRXf6jtFgHao7jk130yaL7SZdQ8TxzfhhW9pAFESMUamJIsBjwFA45wwxr7C2dUSSbU9N7S9oWdQx32JDw27d3IayLsZH63ocMvloYtruzPLMke2gx3lDx6rND1A0ASa93hjX2Fs7dR09kp0lcub86Ra8xlCnYsYKFQA1ekAA9773IPI7aOpUSSUwjehFq0m0bhXyv2wwxrFkbFopPJm09RDlHRlUxrIbto5PUx527S3PDDg1mXlO8Z04hEETk+YSyH0HukKx2ADyLNVZNYYZNZdTObxhpvPeNVR1Kgt56IWZaIKxrXzYAm+AF9iQRIdPlkbTSJKrF7cKswVjt/h3lfS39foTYvFhl1k6UaE0zlNlD0SNtDAoJFZfxErdOGJIaj2+t49RM2ydmgMsjKI1hC0m1dxC7noEEsbY0O1Djkwxr7C2RMfT0WJI1gncbxI8bom2R+Qd5Y7dvPuTVKeSObB4dlZNKiOrJIoYEHkKbJAU36kFgA/IDtjwxr7Bu1Rw6SGTf5cvmvFJAyzb33gyEhfQfaxvsLQrbwMw1kGq2bBqKDARmVIblA5AZrYqas2VA5Nge2GGPU7BNoS9FjWVA0UcyMqxsXjvaihqAsnYo455LEm6oV1/ZykrCJNqURH22o5jADhQvbjZVmvlRwwyaxbOaXo8UzAz6cUpZmLbS8jEbQLj9gKNkgkqOBmjpXhlQrCSQ+TL6niI9W3+GKR/daLFgALLHkgmzDGsX1JXw/NqAduoII8tWNKoVJLIKRlfxJQsXyBVnmhz62A/aDMkCsquhILv6zwDKqA+XuQHuQSdp5HGGGNYvexTO8c7u0Usvr3oY2Uhk2bREyu6hNrertXAN3ddQi3RyvOgZpCW8tOaUKAq3xuf03fzNDgXhhl1huyK6Lp54pUDklHJZ022sYKk7S9bnYMFG6yDzYHvJTRkahXVbjsA/jPdaMn4toI2ha239ecMMawc40shTyXAIYBZJdxbcvuVWuGauxNKTxfvr1OkV53IRowoBU7LEj8GzwRtWh2Fk32qyYY1gfSQ41PqWQptkLSsGCu+8MihSxIKqTbUAeK+WdPWhKSxjZ6WJim0Kbl54bdybAUAChy1+2GGNZB6mKQkSIIzaIHjkLL6lNgq6hvmQQRzxyPfRJJqiSTqSh/lj025R9AzGz+f+nbDDGvsW2f/2Q==">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|number" autocomplete="off" class="layui-input" value="${workOrder.phone}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">住址</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" lay-verify="required|number" autocomplete="off" class="layui-input" value="${workOrder.address}">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">支付方式</label>
                <div class="layui-input-inline">
                    <select name="paymethod" lay-verify="required">
                        <option value="">选择支付方式</option>
                        <option value="支付宝支付"${courseInfo.paymethod=="支付宝支付"?"selected":""}>支付宝支付</option>
                        <option value="微信支付"${courseInfo.paymethod=="微信支付"?"selected":""}>微信支付</option>
                        <option value="银行卡支付" ${courseInfo.paymethod=="银行卡支付"?"selected":""}>银行卡支付</option>
                        <option value="-" ${courseInfo.paymethod=="-"?"selected":""}>其它</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">支付金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="payment" lay-verify="required|number" autocomplete="off" class="layui-input" value="1" value="${workOrder.payment}">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-inline">
                    <label class="layui-form-label">是否需要派人上门维修</label>
                    <div class="layui-input-inline">
                        <select name="status" lay-verify="required">
                            <option value="">选择</option>
                            <option value="是"${courseInfo.status=="是"?"selected":""}>是</option>
                            <option value="否"${courseInfo.status=="否"?"selected":""}>否</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">预约处理时间</label>
                <div class="layui-input-inline">
                    <input id="appointment" name="appointment" lay-verify="required" autocomplete="off" class="layui-input" value="${workOrder.appointment}">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否需要耗材</label>
                <div class="layui-input-inline">
                    <select name="consumables">
                        <option value="">选择</option>
                        <option value="是"${courseInfo.consumables=="是"?"selected":""}>是</option>
                        <option value="否"${courseInfo.consumables=="否"?"selected":""}>否</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input class="layui-btn" type="checkbox"  lay-filter="savebtn"/>
                我已阅读并同意<a style="color: #0000FF">《上门取件服务协议》</a>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="savebtn">确认提交</button>
                <button class="layui-btn layui-btn-primary btn-close">返回</button>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="color:red;">
                <!--错误消息显示-->
                <!--呈现错误信息-->
                <c:forEach items="${allErrors}" var="error">
                    ${error.defaultMessage} &nbsp;&nbsp;
                </c:forEach>
                <div class="ajaxerrordiv"></div>
            </div>
        </div>
</form>

<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ext.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
        $ = layui.$;

        //执行一个laydate实例
        laydate.render({
            elem: '#appointment' //指定元素
        });

        //监听提交
        form.on('submit(savebtn)', function(data) {
            var form = document.getElementById('courseform');
            console.log(form+"0---------------");
            form.action = "${pageContext.request.contextPath}/workOrder/addWorkOrder";
            form.method = "post";
            form.submit();
        });

        //监听提交
        form.on('submit(ajaxsavebtn)', function(data) {
            //layui把表单中的数据封装到data
            var json = JSON.stringify(data.field);
            $(".ajaxerrordiv").html();
            //发起ajax请求
            $.ajax({
                url:"${pageContext.request.contextPath}/courseinfo/ajaxvalid",
                type:"post",
                data:json,
                contentType:"application/json",
                beforeSend:function(XMLHttpRequest){
                    //请求发送前
                    progressLoad("系统正在执行数据提交操作，请稍后...")
                },
                success:function(result){
                    progressClose();
                    //请求发送成功后
                    var msgkey =result.msgkey;
                    var message =result.message;
                    if(msgkey=="validerror"){
                        //验证失败
                        //对json数组进行遍历
                        var errorMsg="";
                        $.each(result.data,function (index,value) {
                            errorMsg+= value.defaultMessage;
                        });
                        $(".ajaxerrordiv").html(errorMsg);
                    }else{
                        //成功后
                        // 关闭当前窗体
                        alert("提交成功");
                        progressClose();
                        //数据表格reload
                        //window.parent.location.reload();
                    }
                },
                complete:function(XMLHttpRequest,textStatus){
                    //请求发送完成
                },
                error:function(XMLHttpRequest,textStatus){
                    //请求发送失败
                }
            });
            //将layui表单域值转换为JSON串：JSON.stringify(data.field)
            return false;
        });

        $(".btn-close").click(function(){
            //关闭父窗口
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });
    });
</script>

</body>

</html>