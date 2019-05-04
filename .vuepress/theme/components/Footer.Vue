<template>
    <div class="footer">
        <div class="footer-card">
            <ul class="list-inline">
                <li>
                    <a target="_blank" :href="$site.themeConfig.footer.csdn">
                 <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa  fa-stack-1x fa-inverse">C</i>
                  </span>
                    </a>
                </li>
                <li>
                    <a target="_blank" :href="$site.themeConfig.footer.zhihu">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa  fa-stack-1x fa-inverse">知</i>
                  </span>
                    </a>
                </li>
                <li>
                    <a target="_blank" :href="$site.themeConfig.footer.github">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                    </a>
                </li>
            </ul>
        </div>
        <div>
            <div>
                {{ $site.themeConfig.footer.filing }}
            </div>
            <div>
                <a href=""><span></span></a>
                Power by <a href="https://vuepress.vuejs.org/" target="_blank">Vuepress</a> Theme by <a
                href="https://vuepress.vuejs.org/" target="_blank">Ermu</a>
            </div>
        </div>
    </div>
</template>
<script>
  import 'font-awesome/css/font-awesome.min.css'

  export default {}
</script>

<style lang="stylus">
    @import '../styles/style.styl'
    .footer
        text-align center
        color lighten($textColor, 25%)
        position fixed
        height $footerHeight
        width 100%
        bottom 0
        z-index 11
        background-color #ffffff
        padding-bottom 10px

    .footer-card
        text-align center

        ul
            padding-left 0
            list-style none

            li
                display inline-block
                padding-right 5px
                padding-left 5px
</style>