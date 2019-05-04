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
    <div class="home-row">
      <div class="home-row-left">
        <ul class="post-list">
          <li class="post-list-item" v-for="(item, i) in posts">
            <NavLink
                class="post-list-title"
                :item="{link:item.path,text:item.title}"
            />
            <p class="post-list-description">
              {{ item.frontmatter.description }}
            </p>
            <p class="post-list-meta">
              Posted by ermu on {{ formatDate(item.frontmatter.createDate) }}
            </p>
          </li>
        </ul>
      </div>
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
          return value.path.endsWith(".html") && value.frontmatter.createDate;
        }).sort((prev, next) => {
          return new Date(prev.frontmatter.createDate).getTime() - new Date(next.frontmatter.createDate).getTime() > 0 ? -1 : 1;
        });
        return posts;
      }
    },
    mounted() {
      let posts = this.$site.pages;
      posts = posts.filter(value => {
        return value.path.endsWith(".html") && value.frontmatter.createDate;
      }).sort((prev, next) => {
        return new Date(prev.frontmatter.createDate).getTime() - new Date(next.frontmatter.createDate).getTime() > 0 ? -1 : 1;
      });
      console.log(posts)
    },
    methods: {
      formatDate (date) {
        return new Date(date).toLocaleDateString()
      }
    }
  }
</script>

<style lang="stylus">
  @import '../styles/style.styl'
  .home
    margin-bottom $footerHeight

  .home-head
    background-color $accentColor
    color $fontColor
    height 15rem
    padding-top $navbarHeight

    .home-head-content
      max-width $mainWidth
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

  .home-row
    max-width $mainWidth
    padding 0 2rem 0
    margin 0px auto

    .home-row-left
      width 66%

  .post-list
    padding-left 0em
    margin-top 0
    margin-bottom 10px

    .post-list-item
      position relative
      padding-top 10px
      padding-bottom 10px
      list-style none
      border-bottom 1px solid #eee

    .post-list-title
      font-size 2rem

    .post-list-description
      margin-top 8px
      margin-bottom 0
      font-size 18px
      color #666

    .post-list-meta
      font-size 18px
      font-family Lora, 'Times New Roman', serif
      font-style italic
      color gray

  @media (max-width: $MQMobile)
    .home-head
      height 10rem

      .home-head-content
        margin-top 2.5rem

        .home-head-content-title
          font-size 2rem
</style>
