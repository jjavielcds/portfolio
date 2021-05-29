import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import LocationOnIcon from '@material-ui/icons/LocationOn';
import Investments from './investments/Investments';

import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";


const useStyles = makeStyles({
  root: {
    width: 500,
  },
});
{/* A <Switch> looks through its children <Route>s and
    renders the first one that matches the current URL. */}
const routes =  <Switch>
                  <Route path="/investmentss" component={Investments} />
                  <Route path="/users">
                    <Users />
                  </Route>
                  <Route path="/">
                    <Home />
                  </Route>
                </Switch>

function Home() {
return <h2>Home</h2>;
}

function Users() {
return <h2>Users</h2>;
}
export default function SimpleBottomNavigation() {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  return (
    <div>
       <Router>
          <BottomNavigation
            value={value}
            onChange={(event, newValue) => {
              setValue(newValue);
            }}
            showLabels
            className={classes.root}
          >
            <BottomNavigationAction label="home" icon={<LocationOnIcon />} component={Link} to="/" />
            <BottomNavigationAction label="investmentss" icon={<LocationOnIcon />} component={Link} to="/investmentss" />
            <BottomNavigationAction label="users" icon={<LocationOnIcon />} component={Link} to="/users" />
          </BottomNavigation>
          {routes}
      </Router>
    </div>
  );
}
