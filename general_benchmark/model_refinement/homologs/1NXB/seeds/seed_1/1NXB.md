# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 7.977 A
- tm_score_ca_ordered: 0.2433665707224021
- heavy_atom_rmsd: 8.621 A
- sidechain_heavy_atom_rmsd: 9.404 A
- **all-atom quality (honest):** heavy 8.621 A, sidechain 9.404 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 590
- bin_accuracy: 0.608

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.977103768078076
- ga_delta_rmsd: -0.5910401239188037  ga_fitness_mode: energy
- pre_local_rmsd: 7.977122214619413  localized_anchor_rmsd: 7.977122214619413

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S8 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.017), conflicts/hub=3.0, max_incompat=2.83Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): S8 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S8** — severity 1.59, 3 conflict(s); suspect input ~`C54` (group: push_out)
  - pull-in (wants closer): G39@6.9Å(now 10.9,conf 0.30)
  - push-out (wants farther): P18@15.5Å(now 11.1,conf 0.20)
  - G39↔C54: targets 6.9/15.2Å but partners are 5.5Å apart → too_close_together by 2.8Å
  - G39↔C53: targets 6.9/14.1Å but partners are 4.4Å apart → too_close_together by 2.8Å
  - G39↔S56: targets 6.9/16.1Å but partners are 6.7Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=17 · 3-10(G)=6 · coil(C)=4

```
CHHHEGHHHEHHHHEHHHEHEHHEGCEGHECGEHHHHEEHHGECEGHHEHEHEHHHHHHE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=12 · sheet=37
  - F3 ↔ S7  (helix)
  - N4 ↔ S8  (helix)
  - S7 ↔ Q11  (helix)
  - S8 ↔ T12  (helix)
  - T12 ↔ C16  (helix)
  - K14 ↔ P18  (helix)
  - C16 ↔ E20  (helix)
  - P18 ↔ S22  (helix)
  - I36 ↔ C40  (helix)
  - K50 ↔ C54  (helix)
  - C54 ↔ V58  (helix)
  - E55 ↔ C59  (helix)
  - Q5 ↔ P10  (sheet)
  - Q5 ↔ T15  (sheet)
  - Q5 ↔ G19  (sheet)
  - Q5 ↔ S21  (sheet)
  - Q5 ↔ Y24  (sheet)
  - P10 ↔ T15  (sheet)
  - P10 ↔ G19  (sheet)
  - P10 ↔ S21  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=416 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=302 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1739 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
