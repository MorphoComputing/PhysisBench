# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1POH/sequence/1POH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1POH/seeds/seed_1/1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 3.242 A
- tm_score_ca_ordered: 0.6236489507114865
- heavy_atom_rmsd: 4.331 A
- sidechain_heavy_atom_rmsd: 5.251 A
- **all-atom quality (honest):** heavy 4.331 A, sidechain 5.251 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 648
- bin_accuracy: 0.546

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=8.2616460690615 -> 7.501926812007844 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.2422924949160867
- ga_delta_rmsd: 4.195670996520943  ga_fitness_mode: energy
- pre_local_rmsd: 3.26620254227837  localized_anchor_rmsd: 3.2423264481314664

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-E4 → 24 conflicts (45%); R16-A18 → 10 conflicts (19%); E24 → 4 conflicts (8%)
- explained: 38/53 conflicts by 3 root cause(s)
- metrics: hubs=26 (frac 0.313), conflicts/hub=2.0, max_incompat=5.39Å, chain_span=0.88
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-E4 + R16-A18 + E24 — explain ~38/53 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F1** — severity 11.20, 8 conflict(s); suspect input ~`E24` (group: pull_in)
  - pull-in (wants closer): G66@9.2Å(now 13.8,conf 0.55), S40@15.5Å(now 18.0,conf 0.55)
  - push-out (wants farther): A18@21.5Å(now 16.2,conf 0.61), E24@17.4Å(now 13.5,conf 0.55), E74@9.4Å(now 4.5,conf 0.55), H75@12.3Å(now 8.4,conf 0.55)
  - Q70↔E24: targets 5.9/17.4Å but partners are 7.4Å apart → too_close_together by 4.1Å
  - A18↔Q70: targets 21.5/5.9Å but partners are 12.4Å apart → too_close_together by 3.2Å
  - A64↔E24: targets 5.6/17.4Å but partners are 8.8Å apart → too_close_together by 3.1Å
- **T61** — severity 10.19, 6 conflict(s); suspect input ~`G38` (group: pull_in)
  - pull-in (wants closer): E4@4.5Å(now 10.4,conf 0.60)
  - E4↔G38: targets 4.5/9.4Å but partners are 19.3Å apart → too_far_apart by 5.4Å
  - E4↔L52: targets 4.5/11.8Å but partners are 19.9Å apart → too_far_apart by 3.6Å
  - E4↔K78: targets 4.5/12.6Å but partners are 5.1Å apart → too_close_together by 3.0Å
- **R16** — severity 8.46, 4 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): Q50@12.3Å(now 15.1,conf 0.55)
  - push-out (wants farther): E65@26.5Å(now 20.6,conf 0.77), E74@20.9Å(now 17.3,conf 0.59), A81@15.0Å(now 11.7,conf 0.55), L79@13.2Å(now 9.6,conf 0.55)
  - E65↔V22: targets 26.5/10.1Å but partners are 11.5Å apart → too_close_together by 4.9Å
  - E65↔G27: targets 26.5/17.4Å but partners are 4.8Å apart → too_close_together by 4.3Å
  - E65↔F21: targets 26.5/8.7Å but partners are 13.7Å apart → too_close_together by 4.1Å
- **V60** — severity 5.42, 4 conflict(s); suspect input ~`Q3` (group: pull_in)
  - pull-in (wants closer): Q3@8.5Å(now 12.3,conf 0.55)
  - S36↔Q3: targets 4.9/8.5Å but partners are 17.0Å apart → too_far_apart by 3.7Å
  - G38↔Q3: targets 9.4/8.5Å but partners are 20.4Å apart → too_far_apart by 2.4Å
  - Q3↔L54: targets 8.5/7.9Å but partners are 18.4Å apart → too_far_apart by 2.0Å
- **Q70** — severity 3.78, 2 conflict(s); suspect input ~`V73` (group: push_out)
  - push-out (wants farther): P17@21.7Å(now 15.0,conf 0.62), A64@7.4Å(now 4.1,conf 0.55), T33@13.0Å(now 7.6,conf 0.55)
  - P17↔V73: targets 21.7/5.4Å but partners are 12.0Å apart → too_close_together by 4.3Å
  - V73↔T33: targets 5.4/13.0Å but partners are 5.0Å apart → too_close_together by 2.5Å
- **Q3** — severity 3.46, 3 conflict(s); suspect input ~`T8` (group: pull_in)
  - pull-in (wants closer): V60@8.5Å(now 12.3,conf 0.55), K39@15.7Å(now 20.2,conf 0.55)
  - push-out (wants farther): N11@21.8Å(now 16.3,conf 0.62), A19@20.6Å(now 15.7,conf 0.59)
  - N11↔T8: targets 21.8/15.9Å but partners are 3.5Å apart → too_close_together by 2.3Å
  - N11↔M80: targets 21.8/11.5Å but partners are 8.1Å apart → too_close_together by 2.1Å
  - N11↔V60: targets 21.8/8.5Å but partners are 11.4Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=39 · strand(E)=31 · 3-10(G)=5 · coil(C)=8

```
CEHECHGEEHEGEEEHEHHHEHHEHHHHHEGCEEEEHHECEEHEHEHHHHHHHHEEHEEGEECECHCEHEHHEHHHGHHHHHC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=16 · sheet=58
  - T6 ↔ P10  (helix)
  - R16 ↔ Q20  (helix)
  - A19 ↔ K23  (helix)
  - V22 ↔ K26  (helix)
  - A25 ↔ T29  (helix)
  - A43 ↔ F47  (helix)
  - S45 ↔ L49  (helix)
  - F47 ↔ T51  (helix)
  - L49 ↔ G53  (helix)
  - G53 ↔ G57  (helix)
  - K71 ↔ H75  (helix)
  - A72 ↔ L76  (helix)
  - E74 ↔ K78  (helix)
  - H75 ↔ L79  (helix)
  - L76 ↔ M80  (helix)
  - K78 ↔ E82  (helix)
  - T8 ↔ L13  (sheet)
  - T8 ↔ H14  (sheet)
  - T8 ↔ P17  (sheet)
  - A9 ↔ H14  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=429 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=241 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2841 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
