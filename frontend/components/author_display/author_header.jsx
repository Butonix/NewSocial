import React from 'react';
import { Link } from 'react-router';
import AuthorFormHeader from "./author_form_header";


class AuthorHeader extends React.Component {
  constructor(props){
    super(props);
    this.state = {
    };

  }

  render(){
    if (this.props.currentUser === null) {
      return(
        <div className="author-header">
          <div className="author-box group">
            <h1 className="author-name">{this.props.author.name}</h1>
            <img src={this.props.author.imageUrl} className = "image-profile"></img>
          </div>
        </div>
      );
    }

    else if (this.props.currentUser.id === this.props.author.id) {
      return(
        <AuthorFormHeader author={this.props.currentUser} editUser={this.props.editUser}/>
      );
    }

    else return(
      <div className="author-header">
        <div className="author-box group">
          <h1 className="author-name">{this.props.author.name}</h1>
          <img src={this.props.author.imageUrl} className = "image-profile"></img>
        </div>
      </div>

    );

  }



}

export default AuthorHeader;
