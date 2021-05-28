
import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function Investments() {

    const [investments, setInvestments] = useState([])

    useEffect(
      () => {
        axios.get('/investments')
        .then( resp => {
          setInvestments(resp.data)
        })
        .catch( resp => console.log(resp))
      }, [investments.length]
    )

    const list = investments.map(item => {
      return(<li key={item.id}>{item.name}</li>)
    })

    return (
      <div>
          {list}
      </div>
    );
  }
  