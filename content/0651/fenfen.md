+++
title = "Fenfen"
description = "复习哪些行为记多少分"
weight = 1

[extra]
toc = false
+++

# 记分分值复习游戏

<section id="fenfen-game" aria-labelledby="fenfen-game-title">
  <div class="fg-main">
    <header class="fg-heading">
      <div>
        <p class="fg-eyebrow">记分挑战</p>
        <h2 id="fenfen-game-title">这个违法行为记几分？</h2>
      </div>
      <span id="fg-card-count" class="fg-pill" aria-hidden="true">第 1 题</span>
    </header>
    <div class="fg-card">
      <p id="fg-violation" class="fg-violation">正在准备题目…</p>
      <fieldset id="fg-answers">
        <legend>请选择本次应记的分数</legend>
        <div class="fg-options">
          <label><input type="radio" name="fg-points" value="12"><span>12 分</span></label>
          <label><input type="radio" name="fg-points" value="9"><span>9 分</span></label>
          <label><input type="radio" name="fg-points" value="6"><span>6 分</span></label>
          <label><input type="radio" name="fg-points" value="3"><span>3 分</span></label>
          <label><input type="radio" name="fg-points" value="1"><span>1 分</span></label>
        </div>
      </fieldset>
      <footer class="fg-footer">
        <p id="fg-feedback" aria-live="polite"></p>
        <button id="fg-next" class="fg-button fg-primary" type="button" hidden>下一题</button>
      </footer>
    </div>
  </div>
  <aside class="fg-status" aria-label="本轮进度">
    <div class="fg-stat">
      <span>本轮得分</span>
      <strong><span id="fg-score">0</span><small> / 10</small></strong>
    </div>
    <div class="fg-stat">
      <span>已完成</span>
      <strong><span id="fg-done">0</span><small> / 10</small></strong>
    </div>
    <button id="fg-new" class="fg-button" type="button">开始新一轮</button>
  </aside>
</section>

<style>
  #fenfen-game {
    --fg-accent: var(--primary-color, #3451db);
    --fg-surface: var(--bg-1, #f3f4f6);
    --fg-card: var(--bg-2, #fff);
    --fg-text: var(--text-0, #202124);
    --fg-muted: var(--text-1, #5f6368);
    display: grid;
    grid-template-columns: minmax(0, 1fr) 11rem;
    gap: 1.25rem;
    margin: 2rem 0 3rem;
    padding: 1.25rem;
    color: var(--fg-text);
    background: var(--fg-surface);
    border: 1px solid var(--border-color, #e5e7eb);
    border-radius: 1rem;
    box-sizing: border-box;
  }
  #fenfen-game * { box-sizing: border-box; }
  #fenfen-game .fg-main { min-width: 0; }
  #fenfen-game .fg-heading {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 1rem;
    margin-bottom: 1rem;
  }
  #fenfen-game .fg-heading h2,
  #fenfen-game .fg-heading p { margin: 0; }
  #fenfen-game .fg-eyebrow {
    color: var(--fg-accent);
    font-size: .75rem;
    font-weight: 700;
    letter-spacing: .12em;
  }
  #fenfen-game .fg-pill {
    flex: none;
    padding: .25rem .65rem;
    color: var(--fg-muted);
    background: var(--fg-card);
    border-radius: 999px;
    font-size: .8rem;
  }
  #fenfen-game .fg-card {
    min-height: 22rem;
    display: flex;
    flex-direction: column;
    padding: clamp(1.1rem, 3vw, 2rem);
    background: var(--fg-card);
    border: 1px solid var(--border-color, #e5e7eb);
    border-radius: .8rem;
    box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0, .06);
  }
  #fenfen-game .fg-violation {
    min-height: 6.5rem;
    margin: 0 0 1.5rem;
    font-size: clamp(1.05rem, 2.5vw, 1.3rem);
    font-weight: 600;
    line-height: 1.75;
  }
  #fenfen-game fieldset { min-width: 0; margin: 0; padding: 0; border: 0; }
  #fenfen-game legend { margin-bottom: .65rem; color: var(--fg-muted); font-size: .85rem; }
  #fenfen-game .fg-options {
    display: grid;
    grid-template-columns: repeat(5, minmax(0, 1fr));
    gap: .55rem;
  }
  #fenfen-game .fg-options label { position: relative; display: block; margin: 0; cursor: pointer; }
  #fenfen-game .fg-options input {
    position: absolute;
    width: 1px;
    height: 1px;
    opacity: 0;
  }
  #fenfen-game .fg-options span {
    display: block;
    padding: .7rem .25rem;
    text-align: center;
    font-weight: 700;
    background: var(--fg-surface);
    border: 2px solid transparent;
    border-radius: .55rem;
    transition: border-color .15s, background-color .15s, color .15s;
  }
  #fenfen-game .fg-options label:hover span,
  #fenfen-game .fg-options input:focus-visible + span { border-color: var(--fg-accent); }
  #fenfen-game .fg-options input:checked + span {
    color: var(--hover-color, #fff);
    background: var(--fg-accent);
    border-color: var(--fg-accent);
  }
  #fenfen-game .fg-options input:disabled + span { cursor: default; opacity: .65; }
  #fenfen-game .fg-options input[data-correct="true"] + span {
    color: #fff;
    background: #16834b;
    border-color: #16834b;
    opacity: 1;
  }
  #fenfen-game .fg-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    min-height: 2.8rem;
    margin-top: auto;
    padding-top: 1.25rem;
  }
  #fenfen-game .fg-footer p { margin: 0; font-weight: 700; }
  #fenfen-game #fg-feedback[data-result="correct"] { color: #16834b; }
  #fenfen-game #fg-feedback[data-result="incorrect"] { color: #c43b32; }
  #fenfen-game .fg-button {
    width: 100%;
    padding: .65rem .8rem;
    color: var(--fg-text);
    font: inherit;
    font-weight: 700;
    background: var(--fg-card);
    border: 1px solid var(--fg-accent);
    border-radius: .55rem;
    cursor: pointer;
  }
  #fenfen-game .fg-button:hover,
  #fenfen-game .fg-button:focus-visible {
    color: var(--hover-color, #fff);
    background: var(--fg-accent);
    outline: none;
  }
  #fenfen-game .fg-primary {
    width: auto;
    min-width: 6.5rem;
    color: var(--hover-color, #fff);
    background: var(--fg-accent);
  }
  #fenfen-game .fg-status {
    display: flex;
    flex-direction: column;
    gap: .75rem;
    padding-left: 1.25rem;
    border-left: 1px solid var(--border-color, #e5e7eb);
  }
  #fenfen-game .fg-stat {
    padding: 1rem;
    background: var(--fg-card);
    border: 1px solid var(--border-color, #e5e7eb);
    border-radius: .7rem;
  }
  #fenfen-game .fg-stat > span { display: block; color: var(--fg-muted); font-size: .75rem; }
  #fenfen-game .fg-stat strong {
    display: block;
    margin-top: .25rem;
    color: var(--fg-accent);
    font-size: 1.75rem;
    line-height: 1.2;
  }
  #fenfen-game .fg-stat small { color: var(--fg-muted); font-size: .75rem; }
  #fenfen-game .fg-status .fg-button { margin-top: auto; }
  @media (max-width: 700px) {
    #fenfen-game { grid-template-columns: 1fr; }
    #fenfen-game .fg-status {
      display: grid;
      grid-template-columns: 1fr 1fr;
      padding: 1rem 0 0;
      border-top: 1px solid var(--border-color, #e5e7eb);
      border-left: 0;
    }
    #fenfen-game .fg-status .fg-button { grid-column: 1 / -1; }
  }
  @media (max-width: 480px) {
    #fenfen-game { padding: .85rem; }
    #fenfen-game .fg-heading { align-items: center; }
    #fenfen-game .fg-options { grid-template-columns: repeat(3, 1fr); }
  }
</style>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const game = document.getElementById("fenfen-game");
    if (!game) return;

    const roundSize = 10;
    const markerPattern = /（[一二三四五六七八九十]+）/g;
    const cards = [];

    // Read the existing list below so it remains the single source of truth.
    document.querySelectorAll("h2").forEach(function (heading) {
      const pointsMatch = heading.textContent.match(/一次记\s*(12|9|6|3|1)\s*分/);
      if (!pointsMatch || heading.closest("#fenfen-game")) return;

      let sourceText = "";
      let sibling = heading.nextElementSibling;
      while (sibling && sibling.tagName !== "H2") {
        sourceText += " " + sibling.textContent;
        sibling = sibling.nextElementSibling;
      }

      const markers = Array.from(sourceText.matchAll(markerPattern));
      markers.forEach(function (marker, index) {
        const start = marker.index + marker[0].length;
        const end = index + 1 < markers.length ? markers[index + 1].index : sourceText.length;
        const text = sourceText.slice(start, end).replace(/\s+/g, " ").trim();
        if (text) cards.push({ text: text, points: Number(pointsMatch[1]) });
      });
    });

    const violation = document.getElementById("fg-violation");
    const answers = document.getElementById("fg-answers");
    const inputs = Array.from(answers.querySelectorAll('input[name="fg-points"]'));
    const feedback = document.getElementById("fg-feedback");
    const nextButton = document.getElementById("fg-next");
    const scoreDisplay = document.getElementById("fg-score");
    const doneDisplay = document.getElementById("fg-done");
    const cardCount = document.getElementById("fg-card-count");
    let round = [];
    let currentIndex = 0;
    let score = 0;
    let answered = false;

    function shuffled(items) {
      const copy = items.slice();
      for (let index = copy.length - 1; index > 0; index -= 1) {
        const randomIndex = Math.floor(Math.random() * (index + 1));
        [copy[index], copy[randomIndex]] = [copy[randomIndex], copy[index]];
      }
      return copy;
    }

    function resetAnswers() {
      inputs.forEach(function (input) {
        input.checked = false;
        input.disabled = false;
        delete input.dataset.correct;
      });
      feedback.textContent = "";
      delete feedback.dataset.result;
      nextButton.hidden = true;
      answered = false;
    }

    function showCard() {
      resetAnswers();
      violation.textContent = round[currentIndex].text;
      cardCount.textContent = "第 " + (currentIndex + 1) + " 题";
      answers.disabled = false;
    }

    function startRound() {
      if (cards.length < roundSize) {
        violation.textContent = "题库读取失败，请刷新页面后重试。";
        answers.disabled = true;
        return;
      }
      round = shuffled(cards).slice(0, roundSize);
      currentIndex = 0;
      score = 0;
      scoreDisplay.textContent = "0";
      doneDisplay.textContent = "0";
      nextButton.textContent = "下一题";
      showCard();
    }

    function finishRound() {
      answers.disabled = true;
      cardCount.textContent = "本轮完成";
      violation.textContent = "本轮得分：" + score + " / " + roundSize;
      feedback.textContent = score === roundSize ? "全部答对，太棒了！" : "再来一轮，继续巩固吧。";
      feedback.dataset.result = score === roundSize ? "correct" : "";
      nextButton.hidden = true;
    }

    inputs.forEach(function (input) {
      input.addEventListener("change", function () {
        if (answered) return;
        answered = true;
        const card = round[currentIndex];
        const correct = Number(input.value) === card.points;

        if (correct) {
          score += 1;
          feedback.textContent = "回答正确！";
          feedback.dataset.result = "correct";
        } else {
          feedback.textContent = "回答错误，正确答案是 " + card.points + " 分。";
          feedback.dataset.result = "incorrect";
        }
        inputs.forEach(function (option) {
          option.disabled = true;
          if (Number(option.value) === card.points) option.dataset.correct = "true";
        });
        scoreDisplay.textContent = String(score);
        doneDisplay.textContent = String(currentIndex + 1);
        nextButton.textContent = currentIndex === roundSize - 1 ? "查看成绩" : "下一题";
        nextButton.hidden = false;
        nextButton.focus();
      });
    });

    nextButton.addEventListener("click", function () {
      if (!answered) return;
      if (currentIndex === roundSize - 1) {
        finishRound();
      } else {
        currentIndex += 1;
        showCard();
      }
    });
    document.getElementById("fg-new").addEventListener("click", startRound);
    startRound();
  });
</script>



---
# 信息：
## 第八条  机动车驾驶人有下列交通违法行为之一，一次记12分：
（一）饮酒后驾驶机动车的；
（二）造成致人轻伤以上或者死亡的交通事故后逃逸，尚不构成犯罪的；
（三）使用伪造、变造的机动车号牌、行驶证、驾驶证、校车标牌或者使用其他机动车号牌、行驶证的；
（四）驾驶校车、公路客运汽车、旅游客运汽车载人超过核定人数百分之二十以上，或者驾驶其他载客汽车载人超过核定人数百分之百以上的；
（五）驾驶校车、中型以上载客载货汽车、危险物品运输车辆在高速公路、城市快速路上行驶超过规定时速百分之二十以上，或者驾驶其他机动车在高速公路、城市快速路上行驶超过规定时速百分之五十以上的；
（六）驾驶机动车在高速公路、城市快速路上倒车、逆行、穿越中央分隔带掉头的；
（七）代替实际机动车驾驶人接受交通违法行为处罚和记分牟取经济利益的。
## 第九条  机动车驾驶人有下列交通违法行为之一，一次记9分：
（一）驾驶7座以上载客汽车载人超过核定人数百分之五十以上未达到百分之百的；
（二）驾驶校车、中型以上载客载货汽车、危险物品运输车辆在高速公路、城市快速路以外的道路上行驶超过规定时速百分之五十以上的；
（三）驾驶机动车在高速公路或者城市快速路上违法停车的；
（四）驾驶未悬挂机动车号牌或者故意遮挡、污损机动车号牌的机动车上道路行驶的；
（五）驾驶与准驾车型不符的机动车的；
（六）未取得校车驾驶资格驾驶校车的；
（七）连续驾驶中型以上载客汽车、危险物品运输车辆超过4小时未停车休息或者停车休息时间少于20分钟的。
## 第十条  机动车驾驶人有下列交通违法行为之一，一次记6分：
（一）驾驶校车、公路客运汽车、旅游客运汽车载人超过核定人数未达到百分之二十，或者驾驶7座以上载客汽车载人超过核定人数百分之二十以上未达到百分之五十，或者驾驶其他载客汽车载人超过核定人数百分之五十以上未达到百分之百的；
（二）驾驶校车、中型以上载客载货汽车、危险物品运输车辆在高速公路、城市快速路上行驶超过规定时速未达到百分之二十，或者在高速公路、城市快速路以外的道路上行驶超过规定时速百分之二十以上未达到百分之五十的；
（三）驾驶校车、中型以上载客载货汽车、危险物品运输车辆以外的机动车在高速公路、城市快速路上行驶超过规定时速百分之二十以上未达到百分之五十，或者在高速公路、城市快速路以外的道路上行驶超过规定时速百分之五十以上的；
（四）驾驶载货汽车载物超过最大允许总质量百分之五十以上的；
（五）驾驶机动车载运爆炸物品、易燃易爆化学物品以及剧毒、放射性等危险物品，未按指定的时间、路线、速度行驶或者未悬挂警示标志并采取必要的安全措施的；
（六）驾驶机动车运载超限的不可解体的物品，未按指定的时间、路线、速度行驶或者未悬挂警示标志的；
（七）驾驶机动车运输危险化学品，未经批准进入危险化学品运输车辆限制通行的区域的；
（八）驾驶机动车不按交通信号灯指示通行的；
（九）机动车驾驶证被暂扣或者扣留期间驾驶机动车的；
（十）造成致人轻微伤或者财产损失的交通事故后逃逸，尚不构成犯罪的；
（十一）驾驶机动车在高速公路或者城市快速路上违法占用应急车道行驶的。
## 第十一条  机动车驾驶人有下列交通违法行为之一，一次记3分：
（一）驾驶校车、公路客运汽车、旅游客运汽车、7座以上载客汽车以外的其他载客汽车载人超过核定人数百分之二十以上未达到百分之五十的；
（二）驾驶校车、中型以上载客载货汽车、危险物品运输车辆以外的机动车在高速公路、城市快速路以外的道路上行驶超过规定时速百分之二十以上未达到百分之五十的；
（三）驾驶机动车在高速公路或者城市快速路上不按规定车道行驶的；
（四）驾驶机动车不按规定超车、让行，或者在高速公路、城市快速路以外的道路上逆行的；
（五）驾驶机动车遇前方机动车停车排队或者缓慢行驶时，借道超车或者占用对面车道、穿插等候车辆的；
（六）驾驶机动车有拨打、接听手持电话等妨碍安全驾驶的行为的；
（七）驾驶机动车行经人行横道不按规定减速、停车、避让行人的；
（八）驾驶机动车不按规定避让校车的；
（九）驾驶载货汽车载物超过最大允许总质量百分之三十以上未达到百分之五十的，或者违反规定载客的；
（十）驾驶不按规定安装机动车号牌的机动车上道路行驶的；
（十一）在道路上车辆发生故障、事故停车后，不按规定使用灯光或者设置警告标志的；
（十二）驾驶未按规定定期进行安全技术检验的公路客运汽车、旅游客运汽车、危险物品运输车辆上道路行驶的；
（十三）驾驶校车上道路行驶前，未对校车车况是否符合安全技术要求进行检查，或者驾驶存在安全隐患的校车上道路行驶的；
（十四）连续驾驶载货汽车超过4小时未停车休息或者停车休息时间少于20分钟的；
（十五）驾驶机动车在高速公路上行驶低于规定最低时速的。
## 第十二条  机动车驾驶人有下列交通违法行为之一，一次记1分：
（一）驾驶校车、中型以上载客载货汽车、危险物品运输车辆在高速公路、城市快速路以外的道路上行驶超过规定时速百分之十以上未达到百分之二十的；
（二）驾驶机动车不按规定会车，或者在高速公路、城市快速路以外的道路上不按规定倒车、掉头的；
（三）驾驶机动车不按规定使用灯光的；
（四）驾驶机动车违反禁令标志、禁止标线指示的；
（五）驾驶机动车载货长度、宽度、高度超过规定的；
（六）驾驶载货汽车载物超过最大允许总质量未达到百分之三十的；
（七）驾驶未按规定定期进行安全技术检验的公路客运汽车、旅游客运汽车、危险物品运输车辆以外的机动车上道路行驶的；
（八）驾驶擅自改变已登记的结构、构造或者特征的载货汽车上道路行驶的；
（九）驾驶机动车在道路上行驶时，机动车驾驶人未按规定系安全带的；
（十）驾驶摩托车，不戴安全头盔的。
