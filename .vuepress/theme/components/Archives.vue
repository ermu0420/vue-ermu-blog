<template>
  <article>
    <div class="item-head">
      <div class="item-head-content">
        <div class="item-head-content-title">{{ $page.frontmatter.title }}</div>
      </div>
    </div>

    <ul class="archives-list">
      <each v-for="(year, i) in postYear">
        <h3>{{year}}</h3>
        <li v-for="(item, i) in getPosts(year)" :key="item.title">
          <span>{{formatDate(item.frontmatter.createDate)}}</span>
          <NavLink
              class="posts-list-name"
              :item="{link:item.path,text:item.title}"
          />
        </li>
      </each>
    </ul>
  </article>
</template>

<script>
  import NavLink from '@theme/components/NavLink.vue'

  export default {
    components: {NavLink},
    data() {
      return {
        postsGroupYear: {},
        postYear: undefined,
      }
    },
    computed: {
    },
    methods: {
      formatDate(date) {
        return (new Date(date).getMonth() + 1) + "-" + new Date(date).getDate()
      },
      groupPosts() {
        this.$site.pages.filter(value => {
          return value.path.endsWith(".html") && value.frontmatter.createDate;
        }).sort((prev, next) => {
          return new Date(prev.frontmatter.createDate).getTime() - new Date(next.frontmatter.createDate).getTime() > 0 ? -1 : 1;
        }).forEach(value => {
          let year = new Date(value.frontmatter.createDate).getFullYear();
          if (!this.postsGroupYear[year]) {
            this.postsGroupYear[year] = new Array();
          }
          this.postsGroupYear[year].push(value)
        });
      },
      getPosts(year){
        return this.postsGroupYear[year];
      }
    },
    mounted() {
      this.groupPosts();
      this.postYear = Object.keys(this.postsGroupYear).sort((prev, next) =>{
        return (prev - next) > 0 ? -1 : 1;
      })
    }
  }
</script>

<style lang="stylus">
  @import '../styles/style.styl'
  $fontColor = #fff
  .item-head
    background-color $accentColor
    color $fontColor
    height 15rem
    padding-top $navbarHeight

    .item-head-content
      max-width $contentWidth
      padding 0 2rem 0
      margin 0px auto
      margin-top 4rem

      .item-head-content-title
        font-size 4rem

  .archives-list
    max-width $contentWidth
    padding 0 2rem 0
    margin 0px auto

    h3
      clear: both
      margin: 0
      margin-left -20px
      padding: 20px 0 10px

    li
      width: 50%;
      line-height: 1.5;
      float: left;
      margin: 10px 0;

  @media (max-width: $MQMobile)
    .item-head
      height 10rem

      .item-head-content
        margin-top 3rem

        .item-head-content-title
          font-size 2rem
</style>
