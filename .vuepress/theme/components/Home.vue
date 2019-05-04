<template>
    <div class="home">

        <div class="home-head">

            <div class="home-head-content">
                <div class="home-head-content-title">{{ $page.frontmatter.title || $site.themeConfig.home.title }}</div>
                <div class="home-head-content-tags">
                    <span class="home-head-content-tag" v-for="(item, i) in $site.themeConfig.home.labels"
                          :key="item.label">
                         <NavLink
                             class="tag-link"
                             :item="item"
                         />
                    </span>
                </div>
            </div>

        </div>

        <div>

        </div>
    </div>
</template>

<script>
    import NavLink from '@theme/components/NavLink.vue'

    export default {
        components: {NavLink},

        computed: {
            data() {
                return this.$page.frontmatter
            },
            posts() {
                let posts = this.$site.pages;
                posts = posts.filter(value => {
                    return value.path.endsWith(".html");
                });
                return this.$site.pages;
            }
        },
        mounted() {
        }
    }
</script>

<style lang="stylus">
    @import '../styles/style.styl'
    .home-head
        background-color $accentColor
        color $fontColor
        height 15rem
        padding-top $navbarHeight

        .home-head-content
            max-width $contentWidth
            padding 0 2rem 0
            margin 0px auto
            margin-top 4rem

            .home-head-content-title
                font-size 4rem

            .home-head-content-tags
                padding-top 0.5rem

                .home-head-content-tag
                    padding-right 10px

                .tag-link
                    color $fontColor !important

    @media (max-width: $MQMobile)
        .home-head
            height 10rem
            .home-head-content
                margin-top 2.5rem
                .home-head-content-title
                    font-size 2rem
</style>
