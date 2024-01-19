<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="personCard.title"/></title>
    <meta name="menu" content="PersonCardMenu"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        .result {
            color: darkgreen;
            font-size: 16px;
            font-weight: bold;
        }

        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>

<%
    String exportToWord = request.getParameter("exportToWord");
    if (exportToWord != null
            && exportToWord.equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-word");
        response.setHeader("Content-Disposition", "inline; filename="
                + "personcard.doc");

    }

%>


<div class="col-sm-2">
</div>
<div class="col-sm-8">
    <%
        if (exportToWord == null && request.getParameter("printer") == null) {
    %>
    <a class="btn btn-primary no-print" href="anketa?id=${personCard.id}&exportToWord=YES">
        <i class="icon-white icon-user no-print"></i>
        Скачать
    </a>
    <input type="button" id="printbtn" class="btn btn-primary no-print" value="Print" name="printer"
           onclick="window.print();">
    <%}%>
    <br/>

    <p class="text-right"><b>Дата заполнения: <fmt:formatDate value="${personCard.dateOfFill}" pattern="dd.MM.yyyy"
                                                              type="both"/></b></p>

    <h3 class="text-center"><b>Индивидуальная оздоровительная программа</b></h3>

    <p><b>№ Амб.карты:</b> <span class="result">${personCard.nAmbCard}</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>Район:</b>
        <span class="result">${personCard.region.name}</span></p>

    <p><b>Ф.И.О.:</b> <span class="result">${personCard.fullName}</span></p>

    <p><b>Дата рождения:</b> <fmt:formatDate value="${personCard.dateOfBirth}" pattern="dd.MM.yyyy" type="both"/>
        &nbsp; &nbsp; &nbsp; &nbsp;<b>Возраст (В):</b> ${personCard.age} лет/год &nbsp; &nbsp;&nbsp; &nbsp;
        <b>Пол:</b> ${sex} </p>

    <p><b>Ваш биологический возраст составил:</b> <span class="result">${personCard.testTexas.biologicAge}</span>
        лет/год</p>

    <p>Риск развития у вас сердечно-сосудистых осложнений (инфаркта, инсульта) согласно таблице SCORE в течении
        ближайших 10 лет составил <span class="result">${personCard.score}</span>%. </p>

    <p>Ваш индекс адаптационного потенциала сердечно-сосудистой системы составил <span
            class="result">${personCard.testPsix.ap}</span>, что соответствует <span class="result">${ap}</span>.
    </p>
    <br/>

    <p> 1. Регулярно измеряйте свое артериальное давление (утром и вечером).</p>
    <c:if test="${personCard.sad>=140 || personCard.dad>=90}">
        <p class="bg-warning">Проконсультируйтесь с вашим врачом по поводу назначения антигипертензивного препарата.</p>
    </c:if>

    <br/>

    <p>2. Ваш индекс массы тела <span class="result">${personCard.bmi}</span> кг/м<sup>2</sup></p>

    <p>Это <span class="result">${bmi}</span>.</p>

    <p>Осуществляйте контроль своего веса тела один-два раза в неделю. Идеальная масса тела должна соответствовать
        рекомендованным границам ( Индекс массы тела в пределах 20-25. Рассчитывается по формуле Кетле:</p>

    <p>ИМТ = М (кг)/ Н2(м), ( где М - масса, Н - рост.)</p>
    <br/>

    <c:if test="${personCard.label==1||personCard.label==3}">
        <p> 3. Рекомендуется <b>диета с низким содержанием соли и жира</b></p>

        <p>-5 разовое питание</p>

        <p>-энергетическое равновесие-рацион должен равняться энергозатратам организма</p>

        <p>-сбалансировать питание по содержанию основных пищевых веществ</p>

        <p>- ограничить прием соли до 5 граммов в сутки.
            - необходимо использовать в пищу больше овощей и фруктов, продуктов из цельных злаков, обезжиренных молочных
            продуктов, рыбы и нежирного мяса</p>

        <p>Потребление фруктов и овощей должно быть не менее 500 г в сутки</p>

        <p>-ограничить прием животных жиров (сливочного масла, свинины, баранины, утятины, жирных колбас).</p>

        <p>-ограничить прием чистых углеводов (сахар, конфеты, варенье) до 20 граммов в сутки.</p>

        <p>- ограничить прием жареных блюд ( не более одного раза в неделю).</p>

        <p>- использовать в рационе цельно зерновые продукты</p>

        <p>- питаться строго в одно и то же время.</p>

        <p>- увеличить в рационе долю продуктов моря (морская капуста, креветки, кальмары и др.).</p>

        <p>- рекомендуются продукты, содержащие витамины С, Е.</p>

        <p>-частое употребление крепкого кофе может повысить риск заболеваний.</p>

        <p>-напоминаем, что вечерний прием пищи должен быть не позже, чем за 1,5-2,0 часа до сна.</p>
    </c:if>

    <p>Ваш <b>базовый обмен веществ</b> составляет <span class="result">${bov}</span> ккал </p>
    <br/>

    <p><b>Ваша приблизительная меню раскладка на день:</b></p>
    <br/>
    <table border="1" class="table table-striped">
        <thead>
        <tr>
            <th>Наименование блюд</th>
            <th>Масса г</th>
            <th>Белки, г</th>
            <th>Жиры, г</th>
            <th>Углеводы, г</th>
            <th>ккал</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><b>Первый завтрак</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <c:forEach items="${lineList1}" var="line" varStatus="status">
            <tr>
                <td>${line.name}</td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.quantity}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.belki}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.jiri}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.uglevodi}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.kkal}"/></td>
            </tr>
        </c:forEach>

        <tr>
            <td><b>Второй завтрак</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <c:forEach items="${lineList2}" var="line" varStatus="status">
            <tr>
                <td>${line.name}</td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.quantity}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.belki}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.jiri}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.uglevodi}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.kkal}"/></td>
            </tr>
        </c:forEach>

        <tr>
            <td><b>Обед</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <c:forEach items="${lineList3}" var="line" varStatus="status">
            <tr>
                <td>${line.name}</td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.quantity}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.belki}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.jiri}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.uglevodi}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.kkal}"/></td>
            </tr>
        </c:forEach>

        <tr>
            <td><b>Полдник</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <c:forEach items="${lineList4}" var="line" varStatus="status">
            <tr>
                <td>${line.name}</td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.quantity}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.belki}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.jiri}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.uglevodi}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.kkal}"/></td>
            </tr>
        </c:forEach>

        <tr>
            <td><b>Ужин</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <c:forEach items="${lineList5}" var="line" varStatus="status">
            <tr>
                <td>${line.name}</td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.quantity}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.belki}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.jiri}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.uglevodi}"/></td>
                <td><fmt:formatNumber maxFractionDigits="2" value="${line.kkal}"/></td>
            </tr>
        </c:forEach>

        <tr>
            <td><b>${lastRowTotal.name}</b></td>
            <td><fmt:formatNumber maxFractionDigits="2" value="${lastRowTotal.quantity}"/></td>
            <td><fmt:formatNumber maxFractionDigits="2" value="${lastRowTotal.belki}"/></td>
            <td><fmt:formatNumber maxFractionDigits="2" value="${lastRowTotal.jiri}"/></td>
            <td><fmt:formatNumber maxFractionDigits="2" value="${lastRowTotal.uglevodi}"/></td>
            <td><b><fmt:formatNumber maxFractionDigits="2" value="${lastRowTotal.kkal}"/></b></td>
        </tr>
        </tbody>
    </table>
    <br/>

    <%--<h3>Варианты завтраков</h3>
    <ol>
        <li>Овсяная каша на воде или нежирном молоке с сухофруктами . Чередуйте с гречневой, рисовой и пшённой кашей.</li>
        <li>Бутерброд из цельно зернового хлеба, маложирного сыра и зелени.</li>
        <li>Стакан простокваши или любого другого кисломолочного напитка.</li>
        <li>Омлет из 4 белков и 2 желтков с зеленью.</li>
        <li>Фрукты.</li>
        <li>Порция творога со сметаной, джемом и свежими фруктами.</li>
    </ol>
    <h3>Обеды</h3>
    <ul>
        <li>Первый: Овощной суп</li>
        <li>Второй: Рыба с гарниром</li>
        <li>Салат:  винегрет</li>
        <li>компот</li>
    </ul>
    <h3>Ужины</h3>
    <ol>
        <li>Тушёные овощи с кусочками отварной куриной грудки</li>
        <li>Овощной омлет из 4 белков и 2 желтков с зеленью</li>
        <li>Овощной салат</li>
        <li>Отварная говядина с запечёнными овощами</li>
    </ol>
    <h3>Перекусы (вы можете выбрать 2 любых пункта)</h3>
    <ol>
        <li>Стакан кефира с 1 ч.л. мёда или варенья</li>
        <li> 20 г чёрного шоколада и зелёное яблоко</li>
        <li> 2 рисовых или гречневых хлебца с творогом и зеленью</li>
        <li>Горсть орехов и сухофруктов (должна уместиться на ладони)</li>
    </ol>--%>

    <p>4. Ваш индекс физического состояния (ИФС) составил <span class="result">${personCard.testPsix.ifs}</span>, что
        соответствует уровню физического состояния <span class="result">${ifs}</span></p>

    <p>Используйте <b>физические упражнения </b>для повышения вашей активности в обычной жизни.</p> <br/>

    <p>-Ежедневно занимайтесь <b>физическими упражнениями:</b></p>

    <p>Во время физических упражнений необходимо следить за частотой пульса, чтобы он не превышал частоты пульса,
        рассчитываемой по формуле <b>ЧСС = (195 + 5 × N) — (A + t) </b> уд./мин.</p>


    <p>где N — порядковый номер уровня физического состояния (1 — низкий уровень физического
        состояния; 2 — ниже среднего; 3 — средний; 4 — выше среднего; 5 — высокий уровень); A — возраст, число
        полных лет; t — длительность, мин.</p>

    <p> Пример программы оздоровительной ходьбы:</p>

    <c:if test="${personCard.label==1}">
        <%@ include file="/WEB-INF/pages/anketaFizikBolnix.jsp" %>
    </c:if>
    <c:if test="${personCard.label==2}">
        <p>Ежедневно обязательно: a) Утренняя 20 – 30 мин. гимнастика; б) Вечерние пешие прогулки до 3 – 4 км; в) фитнес
            (спорт клуб), плавание, врачебно-физкульт. диспансер-2-3 раза в неделе. </p>
        <br/>
        <c:if test="${personCard.testPsix.ifs<0.525}">
            <%@ include file="/WEB-INF/pages/anketaFizikZdorov1.jsp" %>
        </c:if>
        <c:if test="${personCard.testPsix.ifs>=0.525 && personCard.testPsix.ifs<=0.675}">
            <%@ include file="/WEB-INF/pages/anketaFizikZdorov2.jsp" %>
        </c:if>
        <c:if test="${personCard.testPsix.ifs>0.675}">
            <%@ include file="/WEB-INF/pages/anketaFizikZdorov3.jsp" %>
        </c:if>
    </c:if>
    <c:if test="${personCard.label==3}">
        <c:if test="${personCard.bmi>25}">
            <%@ include file="/WEB-INF/pages/anketaFizikPredbolezn.jsp" %>
        </c:if>
        <c:if test="${personCard.bmi<=25}">
            <p>Ежедневно обязательно: a) Утренняя 20 – 30 мин. гимнастика; б) Вечерние пешие прогулки до 3 – 4 км; в)
                фитнес (спорт клуб), плавание, врачебно-физкульт. диспансер-2-3 раза в неделе. </p>
            <br/>
            <c:if test="${personCard.testPsix.ifs<0.525}">
                <%@ include file="/WEB-INF/pages/anketaFizikZdorov1.jsp" %>
            </c:if>
            <c:if test="${personCard.testPsix.ifs>=0.525 && personCard.testPsix.ifs<=0.675}">
                <%@ include file="/WEB-INF/pages/anketaFizikZdorov2.jsp" %>
            </c:if>
            <c:if test="${personCard.testPsix.ifs>0.675}">
                <%@ include file="/WEB-INF/pages/anketaFizikZdorov3.jsp" %>
            </c:if>
        </c:if>
    </c:if>

    <p>Если вам не нравятся прогулки, выберите другие виды физической активности, подходящие стилю вашей жизни:
        велосипед, плавание, гольф, танцы, теннис и прочее.</p>

    </br>

    <c:if test="${personCard.testTexas.answer4==4}">
        <p>5. Курение удваивает риск инфаркта и инсульта;</p>

        <p>Как только вы прекратите курить, риск инфаркта и инсульта у вас начнет сразу же снижаться;</p>

        <p>Через пять лет риск развития инфаркта и инсульта у вас будет таким же, как у некурящих. </p>

        <p><a name="bookmark6">Помощь при никотиновой зависимости</a></p>


        <p>• Убрать с глаз все предметы, которые напоминают о курении. В доме и на рабочем месте не должно быть места
            сигаретам, зажигалкам, пепельницам. </p>

        <p>• Назначить точную дату отказа от курения.</p>

        <p>• Ставить себе цель только на один день. Не зарекаться бросить курить навсегда. </p>

        <p><a name="bookmark8">• Научитесь переключать внимание. Когда невыносимо захотелось закурить, нужно немедленно
            встать н начать что-нибудь делать.</a></p>

        <p>• Смешать в равной пропорции листья крапивы, по­дорожника, мелиссы, вишни, малины, земляники, ро­машки,
            иван-чая,
            зверобоя. Заварить 1 столовую лож­ку срой смеси в заварочном чайнике. Выпивать за сутки. </p>

        <p>Для снижении тяги к курению в первые полгода употребляют препараты, содержащие никотин, такие, как
            жевательная
            резинка «Никоретта», Коррида + R, «Табакул» и им подобные, продающиеся в аптеках.</p>

        <p>Кроме того, рекомендуется употреблять продукты питания, содержащие никотин: баклажаны, томаты, картофель и
            цветную капусту.</p>

        <p>I мкг никотина содержится н: 240 г красных поми­доров; 23 г зелёных помидоров; 140 г картофеля; 10 г
            баклажанов.
            В 1 кг цветной капусты содержится от 4 до 16 мкг никотина.</p>

        <p>Если вы продолжаете курить, то в рацион питания необходимо включить продукты, содержащие вита­мин С: капусту,
            зелёный лук, томаты, сладкий пе­рец, чёрную смородину, хрен, землянику, щавель, лимоны и т. д., т. к. одна
            выкуренная сигарета «кра­дёт» до половины суточной нормы витамина С.</p>

        <p>Если вы употребляете алкоголь, делайте это умеренно.</p>


        <p>Помните, что алкоголь может взаимодействовать с принимаемыми вами лекарствами, и он опасен в больших
            дозах.</p>
    </c:if>
    <p> 6. Раз в полгода проверяйте свой уровень холестерина.</p>

    <p><b>7. Ваш уровень психосоциального стресса: <span class="result">${stressvalue}</span>,
        <span class="result">${stress}</span>.</b></p>
    <c:if test="${'Высокий'.equalsIgnoreCase(stress)}">
    <p>Антистрессовая программа поведения Приведённые ниже правила поведения являются антистрессовыми. Не все они могут
        подойти каждому человеку. Однако, следуя наи­более подходящим из них, можно добиться повышения жизненной
        устойчивости.</p>

    <p> 7.1. Вставайте утром на десять минут раньше, чем обычно. Если вы будете раньше вставать, то избежите раздражения
        с
        раннего утра. Возможно, вам даже нужно приготовиться к утру заранее вечером.</p>

    <p>7.2. Не полагайтесь на свою память. Вместо этого заведите ежедневник, в который записывайте время назначения
        встреч
        и других дел. Таким образом, у вас не будет постоянно беспокоящего чувства, как будто вы что-то должны сделать,
        но не можете вспомнить, что именно.</p>

    <p>7.3. Ослабьте ваши стандарты. В противоположность общепринятому мнению, не всё необходимое стоит делать хорошо.
        Будьте более гибкими. Иногда совершенство не достижимо, или оно не всегда стоит затраченных усилий.</p>

    <p>7.4. Считайте ваши удачи! На каждую сегодняшнюю неудачу или не­везение, вероятно, найдётся десять или больше
        случаев, когда вам повезло! Следует подумать о них.</p>

    <p>7.5. Старайтесь иметь друзей, которые не слишком беспокоятся и тревожатся. Ничто быстрей не выработает у вас
        привычку постоян­ного беспокойства, чем волнения и переживания вместе с другими иронически озабоченными
        людьми.</p>

    <p>7.6. Во время работы периодически необходимо вставать и потягиваться. Не сидите, скрючившись в одном положении,
        весь день.</p>

    <p>7.7. Высыпайтесь. Если необходимо, то используйте будильник для, напоминания о том, что пора идти спать.</p>

    <p>7.8. Создайте из хаоса порядок. Организуйте ваш дом и рабочее место так, чтобы вы могли всегда найти вещи,
        которые ищете.</p>

    <p>7.9. Глубоко и медленно дышите. Когда люди ощущают стресс, они дышат быстро и поверхностно. Это может привести к
        мышечному напряжению вследствие недостаточного снабжения тканей кисло­родом. Расслабьте мышцы и сделайте
        несколько глубоких вдохов, если заметили, что это случилось с вами.</p>

    <p>7.10. Сделайте что-нибудь для улучшения вашего внешнего вида. Ес­ли вы будете выглядеть лучше, то это может
        заставить вас и чувст­вовать себя лучше. </p>

    <p>7.11. Делайте выходные дни как можно более разнообразными. Хотя вам не следует изменять на выходные дни привычное
        время сна, перемена образа жизни может пойти вам на пользу.</p>

    <p>7.12. Прощайте и забывайте. Не жалуйтесь, не ворчите, не испыты­вайте недовольство другими. Примите тот факт, что
        люди вокруг вас и мир, в котором мы живём, несовершенны. С доверием отно­ситесь к словам других людей, если нет
        доказательств обмана. Верь­те тому, что большинство людей стараются делать всё настолько хорошо, насколько
        могут </p>
</c:if>
    <br/>

    <p>9. Применять при нервно-эмоциональных перегрузках и переживаниях успокаивающие препараты растительного
        происхождения (валерьяна, пустырник, боярышник). Если вы не чувствуете эффекта от их применения обратитесь к
        врачу невропатологу. </p>

    <c:if test="${isCardiolog}">
        <p>10. Консультация врача-кардиолога.</p>
    </c:if>

    <c:if test="${personCard.testTexas.answer7==4}">
        <p>11. Консультация врача-эндокринолога. Строго следуйте рекомендациям вашего врача для контроля диабета.</p>
    </c:if>

    <c:if test="${isNevropotolog}">
        <p>12. –Консультация врача-невропатолога </p>
    </c:if>

    <c:if test="${isGastro}">
        <p>13. –Консультация врача-гастроэнтеролога</p>
    </c:if>

    <c:if test="${personCard.testTable.test4==1}">
        <p>14. Консультация врача-окулиста</p>
    </c:if>

    <p>15. Повторное профилактическое обследование через полгода. </p>

    <p>16. Дополнительные рекомендации вашего лечащего врача.</p>

    <%
        if (exportToWord == null && request.getParameter("printer") == null) {
    %>
    <a class="btn btn-primary no-print" href="anketa?id=${personCard.id}&exportToWord=YES">
        <i class="icon-white icon-user no-print"></i>
        Скачать
    </a>
    <input type="button" class="btn btn-primary no-print" value="Print" name="printer" onclick="window.print();">
    <%}%>
</div>
<div class="col-sm-2"></div>

