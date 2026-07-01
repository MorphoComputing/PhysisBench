# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.138 A
- tm_score_ca_ordered: 0.9964097832308285
- heavy_atom_rmsd: 2.890 A
- sidechain_heavy_atom_rmsd: 3.843 A
- **all-atom quality (honest):** heavy 2.890 A, sidechain 3.843 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 588
- bin_accuracy: 0.973

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.13821064361425073
- ga_delta_rmsd: 0.0994347651519896  ga_fitness_mode: energy
- pre_local_rmsd: 0.1396588150584097  localized_anchor_rmsd: 0.13823809873040874

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=26 · 3-10(G)=7 · coil(C)=7

```
CECEEEHHEEGHCEHEEECEEGGHGHEEEEEEECHEEEHEGHHHECEGGEC
```

## Backbone H-bond Network

- total=102 · helix(i→i+4)=3 · sheet=99
  - S8 ↔ Y12  (helix)
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - Y2 ↔ V18  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - C5 ↔ D10  (sheet)
  - C5 ↔ G17  (sheet)
  - C5 ↔ V18  (sheet)
  - C5 ↔ M20  (sheet)
  - C5 ↔ H21  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ M20  (sheet)
  - Y9 ↔ H21  (sheet)
  - … +82 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6259 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
