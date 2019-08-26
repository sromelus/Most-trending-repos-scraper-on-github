import React from 'react';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      repos: [
        name: ''
      ]
    }
  }

  componentDidMount(){
   fetch("/api/v1/trending_repos")
     .then(response => {
       if (response.ok) {
         return response;
       } else {
         let errorMessage = `${response.status}(${response.statusText})` ,
         error = new Error(errorMessage);
         throw(error);
       }
       })
       .then(response => response.json())
       .then(body => {
         this.setState({
           repos: body
         })
       })
       .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let names = this.state.repos.map()
    return(
      <div>
      {this.state.repos[0].name}
      </div>
    )
  }
}

export default App;
