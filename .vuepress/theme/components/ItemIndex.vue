<template>
    <div class="item-index">
        <div class="item-head">
            <div class="item-head-content">
                <div  class="item-head-content-title">{{ $page.frontmatter.title }}</div>
            </div>
        </div>

        <div class="time-line">
            <ul class="posts-list">
                <li class="posts-list-item"  v-for="(item, i) in posts" :key="item.title">
                    <div class="posts-content">
                        <span class="posts-list-meta">{{ item.frontmatter.createDate.substr(0,10) }}</span>
                        <NavLink
                            class="posts-list-name"
                            :item="{link:item.path,text:item.title}"
                        />
                        <span class='circle'></span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import NavLink from '@theme/components/NavLink.vue'

    export default {
        components: {NavLink},
        data() {
            return {

            }
        },
        computed: {
            posts() {
               return this.$site.pages.filter(value => {
                    return value.frontmatter.category === this.$page.frontmatter.category && !value.frontmatter.itemIndex;
                }).sort((prev, next) =>{
                   return new Date(prev.frontmatter.createDate).getTime() - new Date(next.frontmatter.createDate).getTime() > 0 ? -1 : 1;
               });
            }
        },
        mounted() {
        }
    }
</script>

<style lang="stylus">
    @import '../styles/style.styl'
    $fontColor = #fff
    .item-head
        background-color  $accentColor
        color $fontColor
        height 15rem
        padding-top $navbarHeight
        .item-head-content
            max-width $contentWidth
            padding 0 2rem 0
            margin 0px auto
            margin-top 4rem
            .item-head-content-title
                font-size 3rem
    .time-line
        max-width $contentWidth
        padding 2rem
        margin 0px auto
        margin-bottom $footerHeight
    .posts-list
        list-style-type none
        margin 20px 0 20px 120px
        padding-left 30px
        border-left 8px solid $accentColor
        li
            margin: 40px 0
            position: relative
        .posts-content
            position: relative
        .posts-list-meta
            margin-top: -10px;
            top: 50%;
            left: -158px;
            font-size: 0.95em;
            line-height: 20px;
            position: absolute;
        .posts-list-name
            font-size: 25px;
            text-decoration: none;
            opacity: 0.8;
        .circle
            margin-top: -10px;
            top: 50%;
            left: -50px;
            width: 20px;
            height: 20px;
            background: #fff;
            border: 6px solid $accentColor;
            border-radius: 50%;
            display: block;
            position: absolute;
    @media (max-width: $MQMobile)
        .item-head
            height 10rem
            .item-head-content
                margin-top 3rem
                .item-head-content-title
                    font-size 2rem
        .time-line
            max-width $MQMobile
            padding-top 1rem
        .posts-list
            border-left 4px solid $accentColor
            li
                margin: 20px 0
            .posts-list-meta
                top: 60%;
                left: -140px;
            .posts-list-name
                font-size: 0.95rem;
                text-decoration: none;
                opacity: 0.8;
            .circle
                top: 60%;
                left: -40px;
                width: 10px;
                height: 10px;
                border: 3px solid $accentColor;
</style>
