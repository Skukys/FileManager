export default {
    props:['tree'],
    name: 'folder',
    data: function () {
        return {
            isOpen: false
        }
    },
    //language=vue
    template: `
      <li @click="isOpen = true">
      <div class="folder flex" id="folder">
        <div class="folder__header flex" @dblclick="$root.getFolder(tree.id)">
          <div class="folder__img"></div>
          <div class="folder__name">{{tree.name}}</div>
        </div>
        <ul class="folder__content flex">
          <folder 
          v-for="tree in tree.children"
          :tree="tree"
          v-if="isOpen"
          ></folder>
        </ul>
      </div>
      </li>
    `
}

