# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_3\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 6.594 A
- tm_score_ca_ordered: 0.366240067459365
- heavy_atom_rmsd: 7.547 A
- sidechain_heavy_atom_rmsd: 8.439 A
- **all-atom quality (honest):** heavy 7.547 A, sidechain 8.439 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 546
- bin_accuracy: 0.797

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.59414739386174
- ga_delta_rmsd: 0.8188852802165858  ga_fitness_mode: energy
- pre_local_rmsd: 6.6155518765034795  localized_anchor_rmsd: 6.594193823645394

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** F3 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.017), conflicts/hub=3.0, max_incompat=3.63Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): F3 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P10** — severity 4.96, 3 conflict(s); suspect input ~`F3` (group: pull_in)
  - pull-in (wants closer): F3@10.1Å(now 14.0,conf 0.55)
  - G19↔F3: targets 27.1/10.1Å but partners are 13.3Å apart → too_close_together by 3.6Å
  - G41↔F3: targets 20.3/10.1Å but partners are 7.3Å apart → too_close_together by 2.9Å
  - S17↔F3: targets 22.1/10.1Å but partners are 9.3Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=29 · 3-10(G)=11 · coil(C)=14

```
EEGECEHEEGECEEGCEEGGGECEGCEEECHGCEGCCEEHECEEGECHCEGECCEEEHHE
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=0 · sheet=65
  - I1 ↔ T13  (sheet)
  - I1 ↔ K14  (sheet)
  - I1 ↔ S17  (sheet)
  - I1 ↔ P18  (sheet)
  - C2 ↔ Q11  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ P18  (sheet)
  - C2 ↔ S22  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ Q11  (sheet)
  - N4 ↔ T13  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ S17  (sheet)
  - N4 ↔ S22  (sheet)
  - N4 ↔ Y24  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ Y24  (sheet)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=238 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=156 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6222 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
