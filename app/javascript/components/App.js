import React, {Component} from 'react'
import SimpleBottomNavigation from './SimpleBottomNavigation'

class App extends Component{
    render(){
        const hello = 'Hello world!'
        return(
            <div>
                <SimpleBottomNavigation/>
                {hello}
            </div>
        )
    }
}

export default App
