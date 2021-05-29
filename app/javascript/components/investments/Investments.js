
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { DataGrid } from '@material-ui/data-grid';

export default function Investments() {

    const [investments, setInvestments] = useState([])

    useEffect(
      () => {
        axios.get('/investments')
        .then( resp => {
          setInvestments(resp.data)
          console.log(resp.data)
        })
        .catch( resp => console.log(resp))
      }, [investments.length]
    )

    const list = investments.map(item => {
      return(<li key={item.id}>{item.name}</li>)
    })

    const columns = [
      { field: 'id', headerName: 'ID', width: 150 },
      { field: 'name', headerName: 'Name', width: 150 },
      { field: 'tir', headerName: 'TIR', width: 150 },
      { field: 'kind', headerName: 'KIND', width: 150 },
      { field: 'coin', width: 150 },
      { field: 'initial_value', width: 150 },
      { field: 'final_value', width: 150 },
      { field: 'start_date', width: 150 },
      { field: 'end_date', width: 150 },
    ];

    return (
      <div>
            <div style={{ height: 400, width: '100%' }}>
              <DataGrid rows={investments} columns={columns} pageSize={5} checkboxSelection />
            </div>
      </div>
    );
  }
  