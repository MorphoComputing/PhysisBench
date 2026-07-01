# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2HIU/sequence/2HIU.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2HIU/seeds/seed_1/2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 0.941 A
- tm_score_ca_ordered: 0.86094664070644
- heavy_atom_rmsd: 2.887 A
- sidechain_heavy_atom_rmsd: 3.504 A
- **all-atom quality (honest):** heavy 2.887 A, sidechain 3.504 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 990
- bin_accuracy: 0.699

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=2.127525393977089 -> 1.747253960535516 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9409214513719305
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.1246231224589325  localized_anchor_rmsd: 0.9408702344377488

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q14 → 3 conflicts (60%)
- explained: 3/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.064), conflicts/hub=1.7, max_incompat=2.11Å, chain_span=0.064
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q14 — explain ~3/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N17** — severity 3.08, 3 conflict(s); suspect input ~`N21` (group: push_out)
  - push-out (wants farther): V20@18.2Å(now 15.7,conf 0.55), Q22@17.1Å(now 14.3,conf 0.55), N21@16.4Å(now 13.8,conf 0.55)
  - Q14↔N21: targets 6.0/16.4Å but partners are 8.3Å apart → too_close_together by 2.1Å
  - Q22↔C10: targets 17.1/11.1Å but partners are 4.2Å apart → too_close_together by 1.9Å
  - Q14↔Q22: targets 6.0/17.1Å but partners are 9.5Å apart → too_close_together by 1.6Å
- **Q14** — severity 1.10, 1 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N21@11.0Å(now 8.3,conf 0.55), Q22@12.1Å(now 9.5,conf 0.55)
  - C10↔Q22: targets 5.8/12.1Å but partners are 4.2Å apart → too_close_together by 2.0Å
- **E16** — severity 0.89, 1 conflict(s); suspect input ~`V20` (group: push_out)
  - push-out (wants farther): V20@15.3Å(now 12.5,conf 0.55), Q22@15.4Å(now 12.5,conf 0.55), N21@14.1Å(now 11.4,conf 0.55)
  - L12↔V20: targets 5.8/15.3Å but partners are 7.9Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=9 · 3-10(G)=4 · coil(C)=3

```
CHHEHHHEEGEHHHHHHHHHHEHHGHHHHHHHHHHHHHHGEGCECEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=18 · sheet=6
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - N17 ↔ N21  (helix)
  - V20 ↔ L24  (helix)
  - L24 ↔ H28  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ S11  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=164 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=61 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8255 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
