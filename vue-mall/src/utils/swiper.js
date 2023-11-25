export class Swiper {
    constructor(options) {
      this.$options = options;
      this.$current = 0;
      this.__init();
      this.__thetiem();
      this.__pageEvent();
    }
  
    __init() {
      this.content = document.querySelector(this.$options.content);
      this.swiperItem = document.querySelectorAll(this.$options.swiperItem);
      this.page = document.querySelector(this.$options.page).children;
    }
    __pageEvent() {
      [...this.page].forEach((page, index) => {
        page.onclick = () => {
          clearInterval(this.timers);
          this.$current = index;
          this.__content();
          setTimeout(() => {
            this.__thetiem();
          }, 2000);
        };
      });
    }
    __content() {
      this.content.style.left = -800 * this.$current + "px";
    }
    __thetiem() {
      this.timers = setInterval(() => {
        this.$current++;
        if (this.$current > this.swiperItem.length - 1) {
          this.$current = 0;
          this.content.style.transition = "";
        }
        if (this.$current == 1) {
          this.content.style.transition = "all .7s";
        }
        this.__content();
      }, 3000);
    }
  }
  