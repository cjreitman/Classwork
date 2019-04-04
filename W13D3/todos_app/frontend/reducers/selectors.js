export const allTodos = (state) => {
  let keys = Object.keys(state.todos);
  let arr = keys.map( (key) => {
    return state.todos[key];
  });
  return arr;
}; 