# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.123 A
- tm_score_ca_ordered: 0.9979928703845877
- heavy_atom_rmsd: 2.523 A
- sidechain_heavy_atom_rmsd: 3.310 A
- **all-atom quality (honest):** heavy 2.523 A, sidechain 3.310 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 946
- bin_accuracy: 0.968

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.2028840415048795 -> 0.1917349351094142 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.12299574769060914
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.12657412800912496  localized_anchor_rmsd: 0.12294689468248261

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=20 · 3-10(G)=17 · coil(C)=8

```
EEEGGGCHEGGEGHEGEGGHHCEEEGEEGGECCHHHHHHHHHEEGGECGEGHECCGHHHEHHEC
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=5 · sheet=16
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - D58 ↔ G62  (helix)
  - A3 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ R23  (sheet)
  - Q9 ↔ S24  (sheet)
  - P12 ↔ L17  (sheet)
  - L17 ↔ R23  (sheet)
  - R23 ↔ G31  (sheet)
  - S24 ↔ G31  (sheet)
  - E25 ↔ G31  (sheet)
  - M43 ↔ V60  (sheet)
  - M43 ↔ Y63  (sheet)
  - Q44 ↔ V60  (sheet)
  - Q44 ↔ Y63  (sheet)
  - R47 ↔ T53  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=238 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=139 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6772 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1MSI.ensemble.pdb`)
- RMSF mean=0.028Å max=0.099Å (per-residue in .per_residue.csv)
- most flexible residues: 35, 30, 48, 12, 10

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1MSI.pae.csv`
- mean=0.02Å · max=0.118Å · AlphaFold-PAE analog (low block = rigid unit/domain)
