import { RECEIVE_SELECTED_STORY } from '../actions/selected_story_actions';

import merge from 'lodash/merge';

const defaultState = {
  id: null,
  author: { name: null, followed: false },
  title: null,
  content: null,
  likeCount: null,
  topics: [ { id: null, title: null } ],
  responses: [ { id: null, title: null, content: null, author: {id: null, name: null } } ],
  liked: false,
  bookmarked: false,
  timestamp: null
};

export const SelectedStoryReducer = (state = defaultState, action) => {

  switch(action.type){
    case(RECEIVE_SELECTED_STORY):
      return action.story;
    default:
      return state;
  }

};
