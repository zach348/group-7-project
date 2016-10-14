import React, { Component } from 'react';
import FigureList from './FigureList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      figures: []
    }

    this.getFigures = this.getFigures.bind(this)
  }

  getFigures() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/figures.json',
      contentType: 'application/json'
    })
    .done(function(data) {
      app.setState({ figures: data });
    });
  }

  componentDidMount() {
    setInterval(this.getFigures, 5000)
  }

  render() {
    let figures = this.state.figures

    return (
      <div>
        <FigureList figures={figures}/>
      </div>
    );
  };
};

$(document).ready(function () {
    App.getFigures();
    console.log('hit');
});


export default App;
